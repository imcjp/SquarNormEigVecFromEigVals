function [] = checkAlg(M,eigVecs)
%输入原矩阵M以及算法求出的矩阵平方赋范特征向量eigVecs，检验算法求出的矩阵特征向量的正确性
%% 利用eig求出M的特征值和特征向量
[evec,eval]=eig(M);
evec2=evec.*conj(evec);
dV=evec2-eigVecs;
res=sum(dV.*dV);
isRt=true;
for i=1:length(res)
    if res(i)<1e-3
        fprintf('\t第%i个平方赋范特征向量正确,其对应的特征值是%g\n',i,eval(i,i));
    else
        fprintf('\t第%i个平方赋范特征向量正确,其对应的特征值是%g，偏差大小为%g\n',i,eval(i,i),sqrt(res(i)));
        isRt=false;
    end
end
if isRt
    fprintf('算法实现结果正确\n');
else
    fprintf('算法实现结果存在错误\n');
end

