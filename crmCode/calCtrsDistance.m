function DistCluster = calCtrsDistance( ctrs )

% 2017��6��17�� 
% �ú������� ���������ĵľ������
% ���룺
% sup_cluster_label, ctrs������ͼ�ĳ����������Ķ�Ӧ��ϵ spnum��1  ��  ������λ�� spnum��3
% �����
% DistCluster�����spnum*spnum��С�ı�ž��󣬴洢���������

bin_num = size(ctrs,1);
DistCluster = zeros(bin_num,bin_num);
for ii = 1:bin_num
    for jj = 1:bin_num
        if ii~=jj
            DistCluster(ii,jj) = DistanceZL(ctrs(ii,:), ctrs(jj,:), 'euclid');
        else
            DistCluster(ii,jj) = 0;
        end
    end
end

end