function [Y]=MLPTest(W,M,x);
    bias=-1;
    Et=0;E0=0;E1=0;
    lin= size(x);
    [Ne_oculta,col] = size(W);
    %coloando o bias no vetor de entrada x
    x=[bias*ones(lin,1) x];
    Y=[];
    for Ne=1:lin,
        %Foward Propagation
        %loop para os pesos sinapticos ocultos
        Ui=W*x(Ne,:)';
        Zi=1./(1+exp(-Ui));
        Zk=[-1 Zi'];
        %camada de saida
        Uk=M*Zk';
        Y(Ne)=1./(1+exp(-Uk));
        Ne
    end       
end