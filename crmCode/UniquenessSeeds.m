function [ BGindex_unique, FGindex_unique ] = UniquenessSeeds( frame_sup, clusternum, compactness )
% 2017��6��24�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% frame_sup�������ԭʼ����
% clusternum��������Ŀ
% compactness�����������Խ��
% �����
% BGindex_unique, FGindex_unique������ѡ����Ķ����Ա������ӵ��ǰ�����ӵ�
[centers, assignments] = vl_kmeans(frame_sup.rgb', clusternum, 'Initialization', 'plusplus') ;
sup_cluster_label = double(assignments)';
ctrs = centers';

% Method 1
DistCluster = calCtrsDistance( ctrs ); % distance among different clusers
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
%         % Method 2
%         clusterColor = get_clusterColor( frame_sup.lab, sup_cluster_label );
%         DistColorCluster = calClusterColorDistance( clusterColor );
%         [indx indy] = find(DistColorCluster == max(max(DistColorCluster)));
%         indA_unique = indx(1,1);
%         indB_unique = indy(1,1);
%         clusterA = find(sup_cluster_label == indA_unique);
%         clusterB = find(sup_cluster_label == indB_unique);
%         ProbA = 2*sum(DistColorCluster(indA_unique,:))/sum(sum(DistColorCluster));
%         ProbB = 2*sum(DistColorCluster(indB_unique,:))/sum(sum(DistColorCluster));
%         if ProbA > ProbB
%             BGindex_unique = clusterB;
%         else
%             BGindex_unique = clusterA;
%         end
%
%         % Method 3
%         DistCluster = calCtrsDistance( ctrs ); % distance among different clusers
%         [indx indy] = find(DistCluster == max(max(DistCluster)));
%         indA_unique = indx(1,1);
%         indB_unique = indy(1,1);
%         clusterA = find(sup_cluster_label == indA_unique);
%         clusterB = find(sup_cluster_label == indB_unique);
%         ProbA = 2*sum(DistCluster(indA_unique,:))/sum(sum(DistCluster));
%         ProbB = 2*sum(DistCluster(indB_unique,:))/sum(sum(DistCluster));
%         if ProbA > ProbB
%             BGindex_unique = clusterB;
%         else
%             BGindex_unique = clusterA;
%         end
