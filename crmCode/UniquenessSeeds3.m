function [ BGindex_unique, FGindex_unique ] = UniquenessSeeds3( frame_sup, clusternum, compactness, bg_all, Label )
% 2017��6��24�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% frame_sup�������ԭʼ����
% clusternum��������Ŀ 
% compactness�����������Խ��
% bg_all���߽米�����ӵ�
% Label��double�ͳ����ر�ž���
% �����
% BGindex_unique, FGindex_unique������ѡ����Ķ����Ա������ӵ��ǰ�����ӵ�

% bgProb
Pbg = calBGProb( frame_sup, bg_all, Label );
% k-means����
[centers, assignments] = vl_kmeans(frame_sup.rgb', clusternum, 'Initialization', 'plusplus') ;
sup_cluster_label = double(assignments)';% spnum*1
ctrs = centers';
% �����������������������ľ���
sal_cluster =  zeros(clusternum,1);
for ii = 1:clusternum
    index = find(sup_cluster_label == ii);
    sal_cluster(ii,1) = mean(compactness(index));
end
salinfactor = exp(abs(repmat(sal_cluster,1,clusternum)-repmat(sal_cluster',clusternum,1)));

DistCluster = calCtrsDistance( ctrs ).*salinfactor; % distance among different clusers
[indx indy] = find(DistCluster == max(max(DistCluster)));
indA_unique = indx(1,1);
indB_unique = indy(1,1);
clusterA = find(sup_cluster_label == indA_unique);
clusterB = find(sup_cluster_label == indB_unique);
salA = mean(compactness(clusterA));
salB = mean(compactness(clusterB));
PbgA = mean(Pbg(clusterA));
PbgB = mean(Pbg(clusterB));
if salA > salB
    BGindex1_unique = clusterB;
    FGindex1_unique = clusterA;
else
    BGindex1_unique = clusterA;
    FGindex1_unique = clusterB;
end
if PbgA > PbgB
    BGindex2_unique = clusterA;
    FGindex2_unique = clusterB;
else
    BGindex2_unique = clusterB;
    FGindex2_unique = clusterA;
end
if isempty(setdiff(BGindex1_unique,BGindex2_unique)) % �������������ͬ setdiff���ؿռ�
    BGindex_unique = BGindex1_unique;
    FGindex_unique = FGindex1_unique;
else
    BGindex_unique = [];
    FGindex_unique = [];
end
end

