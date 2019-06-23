function DistColorCluster = calClusterColorDistance( clusterColor )

% 2017��6��17�� 
% �ú������� ���������ɫ�������
% ���룺
% clusterColor�����ƽ����ɫ����  �����K��3 
% �����
% DistColorCluster�����K��K��С�ľ��󣬴洢�����ɫ����

bin_num = size(clusterColor,1);
DistColorCluster = zeros(bin_num,bin_num);
for ii = 1:bin_num
    for jj = 1:bin_num
        if ii~=jj
            DistColorCluster(ii,jj) = DistanceZL(clusterColor(ii,:), clusterColor(jj,:), 'euclid');
        else
            DistColorCluster(ii,jj) = 0;
        end
    end
end
DistColorCluster = norm_minmax(DistColorCluster);
end
