function [ ByesSaliency ] = BayesIntegration( propSRRecErrorDiffusionSaliency,compactDiffSaliency,frame_norm,height,width )
%% �ú����������ñ�Ҷ˹��������ں����������Խ��  �ο�����DSR����  2017/05/10
%% ����propSRRecErrorDiffusionSaliency,compactDiffSaliency����M*N��С��ͼƬ
SRPriorBayes = calBayesPosterior(propSRRecErrorDiffusionSaliency,compactDiffSaliency,frame_norm,height,width);
compactPriorBayes = calBayesPosterior(compactDiffSaliency,propSRRecErrorDiffusionSaliency,frame_norm,height,width);
salmaps = zeros(height,width,2);
salmaps(:,:,1) = SRPriorBayes(:,:,1);
salmaps(:,:,2) = compactPriorBayes(:,:,1);
ByesSaliency = combineSalMap(salmaps, '+');
end

