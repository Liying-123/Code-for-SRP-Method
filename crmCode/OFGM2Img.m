function label = OFGM2Img( OFGM )
% 2017��6��29�� ��1���޸� �ú������� �ɱ�Եͼ���ɷָ�����
th = graythresh( OFGM );
label = bwlabel( OFGM >= th);
end
