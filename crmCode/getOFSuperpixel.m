function [ of ] = getOFSuperpixel( input_vals, superpixels, spnum )
% �ó������ڻ�ȡ��ǰ֡�ĳ��������� 20170627
inds = cell(spnum,1);
of = zeros(spnum,2);
for i = 1:spnum
    inds{i} = find(superpixels==i);
    of(i,:) = mean(input_vals(inds{i},:),1);%ÿ�������ص�ƽ����ɫֵ spnum��3  
end
end

