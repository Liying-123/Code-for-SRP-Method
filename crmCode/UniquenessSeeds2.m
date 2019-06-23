function [ BGindex_unique, FGindex_unique ] = UniquenessSeeds2( frame_sup, clusternum, compactness )
% 2017��6��24�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% frame_sup�������ԭʼ����
% clusternum��������Ŀ 
% compactness�����������Խ��
% �����
% BGindex_unique, FGindex_unique������ѡ����Ķ����Ա������ӵ��ǰ�����ӵ�

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
% Method 1
DistCluster = calCtrsDistance( ctrs ).*salinfactor; % distance among different clusers
[indx indy] = find(DistCluster == max(max(DistCluster)));
indA_unique = indx(1,1);
indB_unique = indy(1,1);
clusterA = find(sup_cluster_label == indA_unique);
clusterB = find(sup_cluster_label == indB_unique);
salA = mean(compactness(clusterA));
salB = mean(compactness(clusterB));
if salA > salB
    BGindex_unique = clusterB;
    FGindex_unique = clusterA;
else
    BGindex_unique = clusterA;
    FGindex_unique = clusterB;
end

end

