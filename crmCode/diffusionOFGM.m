function dOFGM = diffusionOFGM( OFGM, R )
% 20170628 ��1���޸� �ú������� ����������ȵ�ȫ�ֶԱȶ�
% ���룺
% MOF_sup�������ؼ��Ĺ���������Ϣ spnum*1
% frame_sup�������ؼ���ԭʼ��Ƶ���� 
% nLabel��double�ͳ����ظ���
% �����
% GC������ȫ�ֶԱ���Ϣ spnum*1
% mask = template( R );
mask = circTemplate( R );
extOFGM = extendImg( OFGM, R );
[m n] = size(OFGM);
dOFGM = zeros(m,n);
for i=R+1:m+R
    for j=R+1:n+R        
        data = extOFGM(i-R:i+R,j-R:j+R);
        dOFGM(i-R,j-R) = sum(sum(data.*mask));    
    end
end
dOFGM = norm_minmax(dOFGM);
end
