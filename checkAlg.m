function [] = checkAlg(M,eigVecs)
%����ԭ����M�Լ��㷨����ľ���ƽ��������������eigVecs�������㷨����ľ���������������ȷ��
%% ����eig���M������ֵ����������
[evec,eval]=eig(M);
evec2=evec.*conj(evec);
dV=evec2-eigVecs;
res=sum(dV.*dV);
isRt=true;
for i=1:length(res)
    if res(i)<1e-3
        fprintf('\t��%i��ƽ����������������ȷ,���Ӧ������ֵ��%g\n',i,eval(i,i));
    else
        fprintf('\t��%i��ƽ����������������ȷ,���Ӧ������ֵ��%g��ƫ���СΪ%g\n',i,eval(i,i),sqrt(res(i)));
        isRt=false;
    end
end
if isRt
    fprintf('�㷨ʵ�ֽ����ȷ\n');
else
    fprintf('�㷨ʵ�ֽ�����ڴ���\n');
end

