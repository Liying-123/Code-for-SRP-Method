function [ intra_sup ] = getIntraSuperpixel( intra, superpixels, spnum )
% �ó������ڻ�ȡ��ǰ֡�ĳ��������� 2017/05/23
inds = cell(spnum,1);
intra_sup = zeros(spnum,1);
for i = 1:spnum
    inds{i} = find(superpixels==i);
    intra_sup(i,:) = mean(intra(inds{i},:),1);%ÿ�������ص�ƽ����ɫֵ spnum��3
end
end


