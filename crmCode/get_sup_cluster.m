% 2016��8��17�� ��1���޸�
% �ú������� ����graph��superpixel֮����������ԵĽڵ�ƥ��
% ���룺
% superinfo��double spnum*3
% Bin_num��kmeans�������
% �����
% sup_cluster_label�����spnum��1��С�ı�ž����ҵ�ÿһ�������ؽڵ㱻�ֵ���һ��
% ctrs��Bin_num��3�ľ�����ÿһ���������
function [sup_cluster_label,ctrs] = get_sup_cluster( superinfo, Bin_num )
% ---- clustering via Kmeans++ -------
[idx,ctrs] = kmeansPP(superinfo',Bin_num);
idx = idx';
ctrs = ctrs';
sup_cluster_label = idx;
end


