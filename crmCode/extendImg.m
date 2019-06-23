function extOFGM = extendImg( OFGM, r )
% 20170628 ��1���޸� �ú������� �������ݶȷ���ͼ������Χ��չR����
% ���룺
% OFGM�����ؼ��Ĺ����ݶȷ�����Ϣ M*N
% R����չ�����С
% �����
% extOFGM���߽���չ���OFGM����
[m n] = size(OFGM);

extOFGM = zeros(m+2*r,n+2*r);
extOFGM(r+1:m+r,r+1:n+r) = OFGM;

extOFGM(1:r,r+1:n+r) = OFGM(1:r,1:n);                 %��չ�ϱ߽�
extOFGM(1:m+r,n+r+1:n+2*r) = extOFGM(1:m+r,n+1:n+r);    %��չ�ұ߽�
extOFGM(m+r+1:m+2*r,r:n+2*r) = extOFGM(m+1:m+r,r:n+2*r);    %��չ�±߽�
extOFGM(1:m+2*r,1:r) = extOFGM(1:m+2*r,r+1:2*r);       %��չ��߽�
end

