function mask = template( R )
% �ó�������������ɢ8�������ģ�� 20170627
% ���ƾ;�������״ģ��
square_mask = eye(2*R+1)+fliplr(eye(2*R+1));
square_mask(R+1,:) = 1;
square_mask(:,R+1) = 1;
% ����Բ��ģ��
m = 2*R + 1; %����ĺ���  
n = 2*R + 1; %���������  
m1 = -m/2:m/2-1;   %��Բ�ı䵽������м�  
n1 = -n/2:n/2-1;  
[x,y] = meshgrid(m1,n1);  
circle = x.^2 + y.^2;   %�����ÿһ�㵽Բ�ĵľ����ƽ��    
circ_mask = zeros(m,n);    
circ_mask(find(circle <= R*R))=1;  %�ҵ�Բ�ڵ�Ԫ�أ�������Ϊ1  
circ_mask(find(circle > R*R))=0;   %�ҵ�Բ���Ԫ�أ�������Ϊ0   
% ����Բ������״ģ��
mask = square_mask.*circ_mask;
end

