clear all;clc;close all;
%% ������ο���Peter Denton���������������·��������"Eigenvectors from Eigenvalues"[1]��ʵ���˸����µ��㷨˼�룬�����㷨�����������֤
% Reference:
% [1] P. B. Denton, S. J. Parke, T. Tao, and X. Zhang, "Eigenvectors from Eigenvalues,", arXiv e-prints, Aug 2019, p. arXiv:1908.03795.
%% ����Hermitian����
n=15; % ����������С
normalMx=randn(n,n)+i*randn(n,n);% M����ͨ����
hermitianMx=normalMx+normalMx';
m=n*0.8;
M2=randn(n,m)+i*randn(n,m);
semiHermitianMx=M2*M2';% SemiHermitianMx�ǰ�����Hermitian����
%% �����㷨�������־����ƽ��������������
[eigVec2sOfNormalMx] = getEigNormVecByPaper(normalMx);
[eigVec2sOfHermitianMx] = getEigNormVecByPaper(hermitianMx);
[eigVec2sOfSemiHermitianMx] = getEigNormVecByPaper(semiHermitianMx);
%% ������ȷ��
fprintf('��ͨ������㷨��������\n');
checkAlg(normalMx,eigVec2sOfNormalMx)
fprintf('Hermitian������㷨��������\n');
checkAlg(hermitianMx,eigVec2sOfHermitianMx)
fprintf('������Hermitian������㷨��������\n');
checkAlg(semiHermitianMx,eigVec2sOfSemiHermitianMx)
