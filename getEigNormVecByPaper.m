function [eigVec2s] = getEigNormVecByPaper(M)
%����ʵ��������[1]�ĺ���˼����ɵ��㷨�����Hermitian����M�ĸ�����������
    %% ����ԭ���������ֵ���ɵ�����
    n=size(M,1);
    eval=eig(M);
    eval(abs(eval)<1e-12)=0;
    %% ����n-1�����Ӿ��������ֵ
    % �������Ӿ��������ֵ���ɵľ��󣬵�i�б�ʾ��i�����Ӿ��������ֵ���ɵ�����
    subEvals=[];
    for i=1:n
        %% ��i�����Ӿ���
        subM=M;
        subM(i,:)=[];
        subM(:,i)=[];
        %% �����i�����Ӿ��������ֵ
        subEval=eig(subM);
        subEvals=[subEvals subEval];
    end
    %% ����ԭ���������ֵeval���������Ӿ�������ֵsubEvals�����ɵ�������ƽ��������������
    % ����������������i�д����i������ֵ��Ӧ��ƽ��������������
    eigVec2s=[];
    for i=1:n
        % ��subEvals2��ʾM-lambda_i*I��ľ�����������Ӿ��������ֵ���ɵľ���
        subEvals2=subEvals-eval(i);
        % �������Ӿ��������ֵ�����۳ˣ��ο����ĵ�eq.3����ʽ
        prodOfSubEvals=prod(subEvals2);
        % M-lambda_i*I�ķ�������ֵ�۳�
        prodEval=eval-eval(i);
        prodEval(i)=1;
        prodEval=prod(prodEval);
        % ���ƽ���������������������в��ŷ��ù��ɾ���eigVec2s
        v1=prodOfSubEvals/prodEval;
        eigVec2s=[eigVec2s v1'];
    end
end

