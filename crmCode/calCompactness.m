function [ compactSal ] = calCompactness( P, sim, spnum, num_vals, x_vals, y_vals )
% ����DCLC������������������� 2017/03/29

Sal = P*sim;%��ɢ�����Ľڵ�����ƾ���
Sal = Sal';

salSup = Sal.*(ones(spnum,1)*num_vals');%ÿ�������������������ص������Գ�������������ظ��� spnum��spnum
Isum = sum(salSup,2);% ÿ�����������������г����صģ�����ֵ*���ظ������ĺ�  ��ʽ13-15�ķ�ĸ
x_valMat = ones(spnum,1)*x_vals'; 
y_valMat = ones(spnum,1)*y_vals';
x0 = (sum(salSup.*x_valMat,2)./Isum)*ones(1,spnum);%ԭ�Ĺ�ʽ14
y0 = (sum(salSup.*y_valMat,2)./Isum)*ones(1,spnum);%ԭ�Ĺ�ʽ15
coherence = sum(salSup.*sqrt((x_valMat-x0).^2 + (y_valMat - y0).^2),2)./Isum;%ԭ�Ĺ�ʽ13 spatial variance

comSal = coherence';
comSal(comSal > mean(comSal)) = mean(comSal);
comSal = 1 - norm_minmax(comSal);
compactSal = comSal';
end

