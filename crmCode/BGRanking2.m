function BGseeds = BGRanking2( BGindex, options, frameName, FGindex, Label )

% 2017��6��22�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% options, frameName�������ԭʼrgb���� ����
% BGindex�����к�ѡ�������ӵ� 
% FGindex��uniqueness prior�õ���ǰ�����ӵ�
% Label�������ر�ž���
% �����
% BGseeds������ѡ����ı������ӵ���
imdata = get_imgData( options.infolder, frameName );% input_im: normalized double data M*N*3
supcol = get_supData( imdata, Label );% ��ȡ�����ص���ɫ���� ����ֱ��ͼ �����
AllHist = supcol.LabHist;% 512*spnum
bgHist = AllHist(:,BGindex); % 512*bgnum
fgHist = AllHist(:,FGindex); % 512*fgnum
FGHist = mean(fgHist,2); % 512*1 ǰ��ƽ��ֱ��ͼ
dist_bgfg = DistanceZL(bgHist', FGHist', 'chi'); % bgnum��1 ���б������ӵ���ǰ�����ֱ��ͼ����
dist_bgbg = sum(DistanceZL(bgHist', bgHist', 'chi'),2); % bgnum��1  ���б������ӵ��������������ӵ��ֱ��ͼ����֮��
dist_bgfg_norm = norm_minmax(dist_bgfg);
dist_bgbg_norm = norm_minmax(dist_bgbg);
th1 = mean(dist_bgfg_norm);
th2 = mean(dist_bgbg_norm);
ind1 = find(dist_bgfg_norm >= th1);
ind2 = find(dist_bgbg_norm <= th2);
label1 = BGindex(ind1);
label2 = BGindex(ind2);
BGseeds = unique(union(label1,label2));

end




