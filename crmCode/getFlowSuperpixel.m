function [ flow_sup ] = getFlowSuperpixel( flow, superpixels, spnum )
% �ó������ڻ�ȡ��ǰ֡�ĳ��������� 2017/05/23
inds = cell(spnum,1);
flow_sup = zeros(spnum,2);
for i = 1:spnum
    inds{i} = find(superpixels==i);
    flow_sup(i,:) = mean(flow(inds{i},:),1);%ÿ�������ص�ƽ����ɫֵ spnum��3
end
end

