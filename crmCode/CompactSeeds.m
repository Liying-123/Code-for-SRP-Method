function [ compactness, BGindex_compact ] = CompactSeeds( frame_sup, P, S, nLabel, bg_num )
% 2017��6��24�� ��1���޸� �ú������� �Ժ�ѡ�������ӵ������ɸѡ
% ���룺
% frame_sup�������ԭʼ����
% P����������
% S�������Ծ���
% nLabel��double�ͳ����ظ���
% �����
% BGindex_compact, FGindex_unique������ѡ����Ķ����Ա������ӵ�
% compactness�����������Խ��
compactness = calCompactness( P, S, nLabel, frame_sup.num, frame_sup.x, frame_sup.y);% spnum��1
[~,ind_compact] = sort(compactness);
BGindex_compact = ind_compact(1:bg_num);
end

