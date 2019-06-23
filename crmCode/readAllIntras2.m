function [ sals, allsals ] = readAllIntras2( data )
% ��ȡ��Ƶ����֡��intra saliency���  2017/05/23 
allsals = [];
nframe = length( data.intra );
sals = cell( nframe, 1 );
for index = 1: nframe
    sals{ index } = norm_minmax(data.intra{index} + data.forinter{index} + data.backinter{index});
    allsals = [allsals;sals{ index }];
end
end

