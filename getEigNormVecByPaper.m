function [eigVec2s] = getEigNormVecByPaper(M)
%根据实现了文章[1]的核心思想完成的算法，求得Hermitian矩阵M的赋范特征向量
    %% 计算原矩阵的特征值构成的向量
    n=size(M,1);
    eval=eig(M);
    eval(abs(eval)<1e-12)=0;
    %% 计算n-1阶主子矩阵的特征值
    % 所有主子矩阵的特征值构成的矩阵，第i列表示第i个主子矩阵的特征值构成的向量
    subEvals=[];
    for i=1:n
        %% 第i个主子矩阵
        subM=M;
        subM(i,:)=[];
        subM(:,i)=[];
        %% 计算第i个主子矩阵的特征值
        subEval=eig(subM);
        subEvals=[subEvals subEval];
    end
    %% 根据原矩阵的特征值eval和所有主子矩阵特征值subEvals所构成的向量求平方赋范特征向量
    % 保存特征向量，第i列代表第i个特征值对应的平方赋范特征向量
    eigVec2s=[];
    for i=1:n
        % 令subEvals2表示M-lambda_i*I后的矩阵的所有主子矩阵的特征值构成的矩阵
        subEvals2=subEvals-eval(i);
        % 各个主子矩阵的特征值进行累乘，参考论文的eq.3的右式
        prodOfSubEvals=prod(subEvals2);
        % M-lambda_i*I的非零特征值累乘
        prodEval=eval-eval(i);
        prodEval(i)=1;
        prodEval=prod(prodEval);
        % 求得平方赋范特征向量，并按列并排放置构成矩阵eigVec2s
        v1=prodOfSubEvals/prodEval;
        eigVec2s=[eigVec2s v1'];
    end
end

