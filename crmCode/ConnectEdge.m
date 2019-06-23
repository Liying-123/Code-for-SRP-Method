function [ConSedge ConSTedge] = ConnectEdge( data, bounds, nframe, centres, height, width )
% 2017/07/06 ��1���޸� �ú������� ����������Ƶ���г�����֮��Ŀռ��Ե�Ϳ�ʱ��Ե
% ���룺
% options, frameName�������ԭʼrgb���� ����
% BGindex�����к�ѡ�������ӵ�
% FGindex��uniqueness prior�õ���ǰ�����ӵ�
% Label�������ر�ž���
% �����
% BGseeds������ѡ����ı������ӵ���

ConSPix = [];
Conedge = [];%�ռ��ڽӹ�ϵ
for index = 1:nframe-1
    Label = data.superpixels{index}.Label;
    [conSPix conedge]= find_connect_superpixel( Label, max(Label(:)), height ,width );
    Conedge = [Conedge;conedge + bounds(index)-1];
end
ConSedge = Conedge;%�ռ��ڽӹ�ϵ
for index = 1:nframe-2
    [x y] = meshgrid(1:bounds(index+1)-bounds(index),1:bounds(index+2)-bounds(index+1));
    conedge = [x(:)+bounds(index)-1,y(:)+bounds(index+1)-1];
    connect = sum((centres(conedge(:,1),:) - centres(conedge(:,2),:)).^2,2 );
    Conedge = [Conedge;conedge(find(connect<800),:)];
end
ConSTedge = Conedge;%�ռ��ڽӹ�ϵ
end


