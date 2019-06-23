function clusterColor = get_clusterColor( color_sup, sup_cluster_label )

% 2017��6��21�� ��1���޸� �ú������� ��ȡ���ƽ����ɫ��Ϣ
% ���룺
% color_sup, ��double spnum*3
% sup_cluster_label��ÿ�������ض�Ӧ������� spnum��1
% �����
% clusterColor����� �������3��С����ɫ����

color_sup_norm(:,1) = norm_minmax(color_sup(:,1));
color_sup_norm(:,2) = norm_minmax(color_sup(:,2));
color_sup_norm(:,3) = norm_minmax(color_sup(:,3));
K = max(sup_cluster_label);
clusterColor = zeros(K,3);
for ii = 1:K
    index = find(sup_cluster_label == ii);
    clusterColor(ii,:) = mean(color_sup_norm(index,:));
end
end

