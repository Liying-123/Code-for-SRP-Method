function allsals = readallsals( videonum, intraSaliency, interForeSaliency, interBackSaliency )
% ��ȡ��Ƶ����֡��intra saliency���  2017/07/08
allsals = [];
nframe = length( interForeSaliency{videonum} );
sals = cell( nframe, 1 );
for index = 1: nframe
    sals{ index } = norm_minmax(intraSaliency{videonum}{index} + interForeSaliency{videonum}{index} + interBackSaliency{videonum}{index});
    allsals = [allsals;sals{ index }];
end
end

