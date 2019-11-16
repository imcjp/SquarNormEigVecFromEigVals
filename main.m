clear all;clc;close all;
%% 本代码参考了Peter Denton、陶哲轩等人最新发表的文章"Eigenvectors from Eigenvalues"[1]，实现了该文章的算法思想，并对算法结果进行了验证
% Reference:
% [1] P. B. Denton, S. J. Parke, T. Tao, and X. Zhang, "Eigenvectors from Eigenvalues,", arXiv e-prints, Aug 2019, p. arXiv:1908.03795.
%% 构建Hermitian矩阵
n=15; % 待检验矩阵大小
normalMx=randn(n,n)+i*randn(n,n);% M是普通矩阵
hermitianMx=normalMx+normalMx';
m=n*0.8;
M2=randn(n,m)+i*randn(n,m);
semiHermitianMx=M2*M2';% SemiHermitianMx是半正定Hermitian矩阵
%% 调用算法计算三种矩阵的平方赋范特征向量
[eigVec2sOfNormalMx] = getEigNormVecByPaper(normalMx);
[eigVec2sOfHermitianMx] = getEigNormVecByPaper(hermitianMx);
[eigVec2sOfSemiHermitianMx] = getEigNormVecByPaper(semiHermitianMx);
%% 检验正确性
fprintf('普通矩阵的算法检验结果：\n');
checkAlg(normalMx,eigVec2sOfNormalMx)
fprintf('Hermitian矩阵的算法检验结果：\n');
checkAlg(hermitianMx,eigVec2sOfHermitianMx)
fprintf('半正定Hermitian矩阵的算法检验结果：\n');
checkAlg(semiHermitianMx,eigVec2sOfSemiHermitianMx)
