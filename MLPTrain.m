function [W,M]=MLPTrain(Ne_oculta,Ne_Saida,epocas,alpha,x,y);
    [lin,col] = size(x);
    %bias ou threshold)
    bias=-1;
    %coloando o bias no vetor de entrada x
    x=[bias*ones(lin,1) x];
    [lin,col] = size(x);
    %Camada de pesos sinapticos, camada oculta 1 Wiq, onde i é o numero de
    %neuônios  e q o numero de atributos de entrada
    W=rand(Ne_oculta,col);
    %camada de pesos associado a cada neurônio k
    M=zeros(Ne_Saida,Ne_oculta+1);
    %interações
    for t=1:epocas,
        %para cada individuo no banco de dados
        I=randperm(lin);
        x=x(I,:);
        y=y(I,:);
        for Ne=1:lin,
            %Foward Propagation
            %loop para os pesos sinapticos ocultos
            Ui=W*x(Ne,:)';
            Zi=1./(1+exp(-Ui));

            Zk=[-1 Zi'];
            %camada de saida
            Uk=M*Zk';
            Yt=1./(1+exp(-Uk));

            %Back propagation
            %erro da saida esperada
            Y=zeros(Ne_Saida,1);
            Y=y(Ne);
            Ek=Y-Yt;
            Dk=Yt.*(1-Yt);
            DDk=Ek.*Dk;
            %derivada da função logistica é f(1-f)
            %Df=Yt*(1-Yt);
            %calculando erro para a camada de saida
            Di=Zi.*(1-Zi);
            DDi=Di.*(M(:,2:end)'*DDk);
            %atualização dos pesos
            W=W + alpha* DDi*x(Ne,:);
            M=M+ alpha*DDk*Zk;
        end    
    end
end