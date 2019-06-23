function MBGseeds = MotionBGRanking( MBGindex, of_sup,  MOF_sup )
% 2017��6��28�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% MBGindex�����к�ѡ�������ӵ� 
% of_sup,  MOF_sup�������ؼ��Ĺ������ݺ͹�����������
% �����
% MBGseeds������ѡ����ı������ӵ���

bgof = of_sup(MBGindex);% bgnum*2
bgmof = MOF_sup(MBGindex);% bgnum*1
bgfeature = [bgof bgmof];% bgnum*3
dist_bgbg = DistanceZL(bgfeature, bgfeature, 'euclid'); % bgnum��bgnum 
Score = norm_minmax(sum(dist_bgbg,2));
[~,index] = sort(Score,'descend');
ind = index(1:floor(0.8*length(MBGindex)));
MBGseeds = MBGindex(ind);
end




