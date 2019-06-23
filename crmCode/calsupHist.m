function [ supHist ] = calsupHist( data, options )
% ��Ƶ����֡��saliencyģ��  2017/07/26
nframe = length( data.superpixels );%���������Ƶ֡��
supHist = [];
for index = 1: nframe
    frameName = data.names{index};
    Label = double(data.superpixels{index}.Label); % int32 M*N
    imdata = get_imgData( options.infolder, frameName );% input_im: normalized double data M*N*3
    supcol = get_supData( imdata, Label );% ��ȡ�����ص���ɫ���� ����ֱ��ͼ �����
    AllHist = supcol.RGBHist';% spnum*512
    supHist = [supHist; AllHist];
end
end

