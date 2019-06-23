function [ Sm,Wm,Pm ] = MotionGraph( of_sup, adjc, nLabel, ismot )
% ����ͼģ�� 20170627
if ismot == 1
    % compute the feature (mean color in lab color space) for each superpixels
    theta = 10;% ԭ����(1/sigma^2)=10,sigma^2=0.1
    % Graph Construction
    W_of =  DistanceZL(of_sup, of_sup, 'euclid'); % euclid ��ʽ9
    Sm = exp(-theta * norm_minmax(W_of));%ԭ���й�ʽ11 �����ڵ�֮��������Ծ���  spnum��spnum ���Խ���Ԫ��Ϊ1
    Wm = Sm.*adjc;% spnum��spnum��affinity����  ԭ�Ĺ�ʽ10
    Pm = Diffusion_Pmatrix( Wm, nLabel );
else
    Sm = [];
    Wm = [];
    Pm = [];
end
end

