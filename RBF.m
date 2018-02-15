clear all
clc
% carrega arquivo de dados
data = importdata('parkson.mat');
N_centros=25;
Ne_Saida=2;
nClass=2;
epocas=1000;
bias=-1;
[m,n] = size(data);
y=data(:,end); 
x=data(:,1:end-1);
for i=1:m,
	for j=1:n-1		
		x(i,j)=x(i,j)/max(x(:,j));
	end
end
[lin,col] = size(x);
M=[];
C=[];
phi=[];
D=zeros(lin,Ne_Saida);
I=randperm(lin);
x=x(I,:);
y=y(I,:);
C=x(1:N_centros,:);

% for i=1:N_centros,
%     phi(i)=100000;
%     for j=1:N_centros,
%         nor=norm(C(i) - C(j));
%         if (j~=i)&&(phi(i)>nor)
%             phi(i)=nor;
%         end
%     end
% end


phi=phi./2;
for t=1:epocas,
        %para cada individuo no banco de dados
        D=zeros(lin,Ne_Saida);
        I=randperm(lin);
        x=x(I,:);
        y=y(I,:);
        Zk=[];
     
        for Ne=1:lin,
            %Foward Propagation
            D(Ne,y(Ne)+1)=1;
            %loop para os pesos sinapticos ocultos
            
            Ui=norm(x(Ne,:)-C(i));
            
            %Ui=sqrt((x(Ne,:)-C(i)).^2);
            Zi=exp(-(Ui.^2)./2*phi(i).^2);
            Zi=[-1 Zi'];
            Zk(:,Ne)=Zi;
        end    
        
        D=D';
        M = D*pinv(Zk);
end

    A=M*Zk;Et=0;E0=0;E1=0;
    for Ne=1:lin,
        
        Y=zeros(Ne_Saida,1);
        Y=D(:,Ne);
        Yt=A(:,Ne);
        
        
        [out_OK iout_OK]=max(Y);  % Indice da saida desejada de maior valor
        [out_T iout_T]=max(Yt); % Indice do neuronio cuja saida eh a maior
        if iout_OK~=iout_T,   % Conta acerto se os dois indices coincidem 
            if(y(Ne)==0)
                E0=E0+1;
            else
                E1=E1+1;
            end
        end
        Et=E0+E1;
    end 
