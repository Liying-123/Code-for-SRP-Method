function GC = GlobalContrast( MOF_sup, frame_sup, nLabel )
% 2017��6��27�� ��1���޸� �ú������� ����������ȵ�ȫ�ֶԱȶ�
% ���룺
% MOF_sup�������ؼ��Ĺ���������Ϣ spnum*1
% frame_sup�������ؼ���ԭʼ��Ƶ���� 
% nLabel��double�ͳ����ظ���
% �����
% GC������ȫ�ֶԱ���Ϣ spnum*1

location = [norm_minmax(frame_sup.x) norm_minmax(frame_sup.y)];% spnum*2
dist_loc = DistanceZL(location, location, 'euclid'); % spnum��spnum
dist = exp(-dist_loc/0.4);
sal = abs(repmat(MOF_sup,1,nLabel)-repmat(MOF_sup',nLabel,1));
GC = norm_minmax(sum(sal.*dist,2));
end

