function [ GC, BGindex_MU ] = MotionUniqueSeeds( frame_sup, MOF_sup, nLabel, bg_num )
% 2017��6��24�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% frame_sup�������ԭʼ����
% MOF_sup��������������
% nLabel��double�ͳ����ظ���
% �����
% BGindex_compact, FGindex_unique������ѡ����Ķ����Ա������ӵ�
% compactness�����������Խ��
GC = GlobalContrast( MOF_sup, frame_sup, nLabel );% spnum��1
[~,ind_GC] = sort( GC );
BGindex_MU = ind_GC(1:bg_num);
end

