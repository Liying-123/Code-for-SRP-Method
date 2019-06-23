function [ sim,W ] = Graph( rgb_vals, adjc, of_sup )
% ����ͼģ�� 2017.03.19
% compute the feature (mean color in lab color space) for each superpixels
theta = 10;% ԭ����(1/sigma^2)=10,sigma^2=0.1
seg_vals = colorspace('Lab<-', rgb_vals);%ת����Lab�ռ� spnumn*3
% Graph Construction
W_lab =  DistanceZL(seg_vals, seg_vals, 'euclid'); % euclid ��ʽ9
W_of =  DistanceZL(of_sup, of_sup, 'euclid'); % euclid ��ʽ9
sim = exp(-theta * norm_minmax(W_lab + W_of));%ԭ���й�ʽ11 �����ڵ�֮��������Ծ���  spnum��spnum ���Խ���Ԫ��Ϊ1
W = sim.*adjc;% spnum��spnum��affinity����  ԭ�Ĺ�ʽ10
end

