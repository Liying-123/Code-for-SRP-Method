function [ P ] = Diffusion_Pmatrix( W, spnum )

alpha = 0.99;
dd = sum(W,2); % �����ؽڵ�Ķ� degree
D = sparse(1:spnum,1:spnum,dd);%�ԽǾ���
P = (D-alpha*W)\eye(spnum); %eye������λ���� �ȼ���(D-alpha*W)���� 

end

