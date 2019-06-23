function [ Sc,Wc,Pc ] = GraphConstruct( rgb_vals, adjc, nLabel )
% ����ͼģ�� 2017.03.19
% compute the feature (mean color in lab color space) for each superpixels
theta = 10;% ԭ����(1/sigma^2)=10,sigma^2=0.1
seg_vals = colorspace('Lab<-', rgb_vals);%ת����Lab�ռ� spnumn*3
% Graph Construction
W_lab =  DistanceZL(seg_vals, seg_vals, 'euclid'); % euclid ��ʽ9
Sc = exp(-theta * norm_minmax(W_lab));%ԭ���й�ʽ11 �����ڵ�֮��������Ծ���  spnum��spnum ���Խ���Ԫ��Ϊ1
Wc = Sc.*adjc;% spnum��spnum��affinity����  ԭ�Ĺ�ʽ10
Pc = Diffusion_Pmatrix( Wc, nLabel );
end

