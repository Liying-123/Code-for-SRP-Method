function [ BackSRRecError, propBackSRRecError, diffpropBackSRRecError ] = calBackwardSRRecError_20170703( options, curframe_sup, backframe_sup, P_current, ismot )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����ϡ���ؽ������ȡ���������� 2017/05/25 
% ʹ��28ά������ʾ���������� RGB Lab HSV texton��15�� x y flowx flowy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sparse representation parameters
paramSR.lambda2 = 0;
paramSR.mode    = 2;
paramSR.lambda  = 0.01;
%% Context-based error propagation parameters
paramPropagate.lamna = 0.5;
paramPropagate.nclus = 8;
paramPropagate.maxIter = 200;
if ismot ==1
    %% Extract superpixel features for current frame
    sulabel_current = double(curframe_sup.Label);
    supNum_current = max(sulabel_current(:));
    regions_current = calculateRegionProps(supNum_current,sulabel_current);
    colfeat_current = extractSupfeat_col(options, curframe_sup.Name, sulabel_current, regions_current); % supNum*26
    feat_current = [colfeat_current curframe_sup.opflow curframe_sup.MOF curframe_sup.intra curframe_sup.forward];% supNum*31
    featDim_current = size(feat_current,2);
    %% Extract superpixel features for back frame
    sulabel_back = double(backframe_sup.Label);
    supNum_back = max(sulabel_back(:));
    regions_back = calculateRegionProps(supNum_back,sulabel_back);
    colfeat_back = extractSupfeat_col(options, backframe_sup.Name, sulabel_back, regions_back); % supNum*26
    feat_back = [colfeat_back backframe_sup.opflow backframe_sup.MOF backframe_sup.intra backframe_sup.forward];% supNum*31
else
    %% Extract superpixel features for current frame
    sulabel_current = double(curframe_sup.Label);
    supNum_current = max(sulabel_current(:));
    regions_current = calculateRegionProps(supNum_current,sulabel_current);
    colfeat_current = extractSupfeat_col(options, curframe_sup.Name, sulabel_current, regions_current); % supNum*26
    feat_current = [colfeat_current curframe_sup.intra curframe_sup.forward];% supNum*28
    featDim_current = size(feat_current,2);
    %% Extract superpixel features for back frame
    sulabel_back = double(backframe_sup.Label);
    supNum_back = max(sulabel_back(:));
    regions_back = calculateRegionProps(supNum_back,sulabel_back);
    colfeat_back = extractSupfeat_col(options, backframe_sup.Name, sulabel_back, regions_back); % supNum*26
    feat_back = [colfeat_back backframe_sup.intra backframe_sup.forward];% supNum*28
end
%% Extract foreground templates from back frame
fg_sp_intra = extract_fg_sp(backframe_sup.intra,0.5*options.fg_num);%factor�ǳ߶����ӣ������ܳ����ظ�����ѡ��ǰfactor%����������ǰ�����ӵ�
fg_sp_forward = extract_fg_sp(backframe_sup.forward,0.5*options.fg_num);%factor�ǳ߶����ӣ������ܳ����ظ�����ѡ��ǰfactor%����������ǰ�����ӵ�
fg_sp = union(fg_sp_intra,fg_sp_forward);
Dictionary = feat_back(fg_sp,:);
%% Calculate sparse reconstruction error for current frame
BackSRRecError = calculateSRError(Dictionary',feat_current',paramSR);%����ؽ����
%% Propagate sparse reconstruction error for current frame
propBackSRRecError = descendPropagation(feat_current,BackSRRecError,paramPropagate,supNum_current,featDim_current);% 1*spnum
diffpropBackSRRecError = norm_minmax(P_current*propBackSRRecError');% spnum*1 Manifold Ranking-based Diffusion
end


