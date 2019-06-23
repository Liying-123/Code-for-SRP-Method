function BGseeds = BGRanking7( BGindex, options, frameName, Label, frame_sup, bg_all )
% 2017��6��24�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% options, frameName�������ԭʼrgb���� ����
% BGindex�����к�ѡ�������ӵ� 
% FGindex��uniqueness prior�õ���ǰ�����ӵ�
% Label�������ر�ž���
% �����
% BGseeds������ѡ����ı������ӵ���

%  RBD method of bgProb
colDistM = GetDistanceMatrix(frame_sup.lab);
adjcMatrix = GetAdjMatrix(Label, max(max(Label)));
[clipVal, geoSigma, neiSigma] = EstimateDynamicParas(adjcMatrix, colDistM);
[bgProb, bdCon, bgWeight] = EstimateBgProb(colDistM, adjcMatrix, bg_all', clipVal, geoSigma);
Pbg = bgProb(BGindex);

imdata = get_imgData( options.infolder, frameName );% input_im: normalized double data M*N*3
supcol = get_supData( imdata, Label );% ��ȡ�����ص���ɫ���� ����ֱ��ͼ �����
AllHist = supcol.LabHist;% 512*spnum
bgHist = AllHist(:,BGindex); % 512*bgnum
dist_bgbg = DistanceZL(bgHist', bgHist', 'chi')*Pbg; % bgnum��1  ���б������ӵ��������������ӵ��ֱ��ͼ����֮��
Score = norm_minmax(dist_bgbg);
th1 = mean(Score);
ind = find(Score <= th1);
BGseeds = BGindex(ind);

end




