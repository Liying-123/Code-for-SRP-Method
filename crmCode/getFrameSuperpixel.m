function [ frame_sup ] = getFrameSuperpixel( input_vals, superpixels, spnum, height, width )
% �ó������ڻ�ȡ��ǰ֡�ĳ��������� 2017.03.29
STATS = regionprops(superpixels, 'all');%�õ������ر�ž�������������������������ġ������ȡ�
inds = cell(spnum,1);
[x, y] = meshgrid(1:1:width, 1:1:height);%m��n�ľ���ÿ����1~n������
frame_sup.rgb = zeros(spnum,3);
frame_sup.x = zeros(spnum,1);
frame_sup.y = zeros(spnum,1);
frame_sup.num = zeros(spnum,1);
frame_sup.area = zeros(spnum,1);
frame_sup.adjc = zeros(spnum,spnum);
for i = 1:spnum
    inds{i} = find(superpixels==i);
    frame_sup.num(i) = length(inds{i});%ÿ�������ذ������صĸ���
    frame_sup.rgb(i,:) = mean(input_vals(inds{i},:),1);%ÿ�������ص�ƽ����ɫֵ spnum��3
    frame_sup.x(i) = sum(x(inds{i}))/frame_sup.num(i);%�����ص�x����
    frame_sup.y(i) = sum(y(inds{i}))/frame_sup.num(i);%�����ص�y����
    frame_sup.area(i,:) = STATS(i).Area;    
end
frame_sup.adjc = calAdjacentMatrix(superpixels,spnum);
frame_sup.lab = colorspace('Lab<-', frame_sup.rgb);
end

