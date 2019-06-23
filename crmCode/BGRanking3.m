function BGseeds = BGRanking3( BGindex, options, frameName, FGindex, Label, frame_sup, bg_all, compactness )
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
dist_bgbg_norm = norm_minmax(dist_bgbg);
th2 = mean(dist_bgbg_norm);
ind2 = find(dist_bgbg_norm <= th2);
label2 = BGindex(ind2);

if ~isempty(FGindex)
    Sfg = mean(compactness(FGindex));%1*1
    Sbg = compactness(BGindex);%bgnum*1
    Sfactor = exp(abs(Sbg-Sfg));
        
    fgHist = AllHist(:,FGindex); % 512*fgnum
    FGHist = mean(fgHist,2); % 512*1 ǰ��ƽ��ֱ��ͼ
    dist_bgfg = DistanceZL(bgHist', FGHist', 'chi').*Sfactor; % bgnum��1 ���б������ӵ���ǰ�����ֱ��ͼ����   
    dist_bgfg_norm = norm_minmax(dist_bgfg);
    
    th1 = mean(dist_bgfg_norm);
    ind1 = find(dist_bgfg_norm >= th1);
    label1 = BGindex(ind1);
    
    BGseeds = unique(union(label1,label2));
else
    BGseeds = label2;
end

end




