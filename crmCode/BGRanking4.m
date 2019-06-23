function BGseeds = BGRanking4( BGindex, options, frameName, FGindex, Label, frame_sup, bg_all, compactness )
% 2017��6��24�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% options, frameName�������ԭʼrgb���� ����
% BGindex�����к�ѡ�������ӵ� 
% FGindex��uniqueness prior�õ���ǰ�����ӵ�
% Label�������ر�ž���
% �����
% BGseeds������ѡ����ı������ӵ���

%  RBD method of bgProb
bdIds = GetBndPatchIds(Label);
colDistM = GetDistanceMatrix(frame_sup.lab);
adjcMatrix = GetAdjMatrix(Label, max(max(Label)));
[clipVal, geoSigma, neiSigma] = EstimateDynamicParas(adjcMatrix, colDistM);
[bgProb, bdCon, bgWeight] = EstimateBgProb(colDistM, adjcMatrix, bg_all', clipVal, geoSigma);
Pbg = bgProb(BGindex);

Sfg = mean(compactness(FGindex));%1*1
Sbg = compactness(BGindex);%bgnum*1
Sfactor = exp(abs(Sbg-Sfg));

imdata = get_imgData( options.infolder, frameName );% input_im: normalized double data M*N*3
supcol = get_supData( imdata, Label );% ��ȡ�����ص���ɫ���� ����ֱ��ͼ �����
AllHist = supcol.LabHist;% 512*spnum
bgHist = AllHist(:,BGindex); % 512*bgnum
fgHist = AllHist(:,FGindex); % 512*fgnum
FGHist = mean(fgHist,2); % 512*1 ǰ��ƽ��ֱ��ͼ
dist_bgfg = DistanceZL(bgHist', FGHist', 'chi').*Sfactor; % bgnum��1 ���б������ӵ���ǰ�����ֱ��ͼ����
dist_bgbg = DistanceZL(bgHist', bgHist', 'chi')*Pbg; % bgnum��1  ���б������ӵ��������������ӵ��ֱ��ͼ����֮��
dist_bgfg_norm = norm_minmax(dist_bgfg);
dist_bgbg_norm = norm_minmax(dist_bgbg);
Score = 0.5 * dist_bgfg_norm + 0.5*(1-dist_bgbg_norm);
th1 = mean(Score);
ind = find(Score >= th1);
BGseeds = BGindex(ind);

end




