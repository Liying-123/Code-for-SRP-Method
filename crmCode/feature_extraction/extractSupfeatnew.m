function [sup_feat] = extractSupfeatnew(options, frameName, sulabel, regions, of_sup,  MOF_sup)
%% Extract superpixel features.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spdata.R ��ɫ���� 1��spnum
% spdata.G ��ɫ���� 1��spnum
% spdata.B ��ɫ���� 1��spnum
% spdata.RGBHist RGBֱ��ͼ 512��spnum
% spdata.L ��ɫ���� 1��spnum
% spdata.a ��ɫ���� 1��spnum
% spdata.b ��ɫ���� 1��spnum
% spdata.LabHist Labֱ��ͼ 512��spnum
% spdata.H ��ɫ���� 1��spnum
% spdata.S ��ɫ���� 1��spnum
% spdata.V ��ɫ���� 1��spnum
% spdata.HSVHist HSVֱ��ͼ 512��spnum
% spdata.texture ���� 15��spnum
% spdata.textureHist ����ֱ��ͼ 15��spnum
% spdata.lbpHist LBPֱ��ͼ 256��spnum

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imdata = get_imgData( options.infolder, frameName );% input_im: normalized double data M*N*3
spdata = get_supData( imdata, sulabel );% struct data
sup_num = max(sulabel(:));

row = size(sulabel,1);
col = size(sulabel,2);

sup_feat = [];
for r = 1:sup_num
    indxy = regions{r}.pixelIndxy;
    location = [mean(indxy(:,2))/col,mean(indxy(:,1))/row];% 1*2
    color = [spdata.R(r) spdata.G(r) spdata.B(r) spdata.L(r) spdata.a(r) spdata.b(r) spdata.H(r) spdata.S(r) spdata.V(r)];% 1*9
    texture = spdata.texture(:,r);% 1*15
    motion = [of_sup(r)  MOF_sup(r)];% 1*3
    feat = [color location texture' motion];% 1*29
    sup_feat = [sup_feat;feat];
end