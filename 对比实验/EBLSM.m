clear all
%% Data set from 
% 2022 -A generalized χ 2 divergence for multisource
% information fusion and its application in
% fault diagnosis
% 
G = [1,0,0;0,1,0;0,0,1;1,1,1];
F = sum(G,2);cluster = 3;
M = [0.7,0.1,0,0.2;
    0.7,0,0,0.3;
    0.65,0.15,0,0.2;
    0.75,0,0.05,0.2;
    0,0.2,0.8,0];
M = M(1:5,:);
%% Iris 
% G = [1,0,0;0,1,0;0,0,1;1,1,0;1,0,1;0,1,1;1,1,1];
% F = sum(G,2); cluster = 3;
% M = [0.3337,0.3165,0.2816,0.0307,0.0052,0.0272,0.0052;
%     0.3164,0.2501,0.2732,0.0304,0.0481,0.0515,0.0304;
%     0.6699,0.2374,0.0884,0,0,0.0043,0;
%     0.6996,0.2120,0.0658,0,0,0.0226,0];

%% Iris with noise
% G = [1,0,0;0,1,0;0,0,1;1,1,0;1,0,1;0,1,1;1,1,1];
% F = sum(G,2); cluster = 3;
% M = [0.3337,0.3165,0.2816,0.0307,0.0052,0.0272,0.0052;
%     0,0.99,0.01,0,0,0,0;
%      0.6699,0.2374,0.0884,0,0,0.0043,0;
%      0.6996,0.2120,0.0658,0,0,0.0226,0];

%% Data Set from 
% 2022 Enhanced mass Jensen–Shannon divergence for information fusion

%  G = [1,0,0;0,1,0;0,0,1;1,1,1];
%  F = sum(G,2);cluster = 3;
%  M = [0.4,0.6,0,0;
%       0,0.7,0.3,0;
%       0.85,0,0,0.15;
%       0.4,0.6,0,0;
%       0.75,0,0,0.25];
% M = M(1:5,:);
%% Data Set from
% 2018-Multisensor Fault Diagnosis Modeling Based on the Evidence Theory

% G = [1,0,0;0,1,0;0,0,1;1,1,1];
% F = sum(G,2);cluster = 3;
% M = [0.7,0.15,0.15,0;
%      0.4,0.2,0.4,0;
%      0.65,0.35,0,0;
%      0.75,0,0.25,0;
%      0,0.2,0.8,0];

%% Data Set from
% 2018-A correlation coefficient for belief functions
% 
% G = [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1;1,1,1,1];
% F = sum(G,2);cluster = 4;
% M = [0.06,0.68,0.02,0.04,0.20;
%      0.02,0,0.79,0.05,0.14;
%      0.02,0.58,0.16,0.04,0.20];

%% Data Set from
% 2020-A new divergence measure for belief functions in D–S
% evidence theory for multisensor data fusion

% G = [1,0,0;0,1,0;0,0,1;1,0,1];
% F = sum(G,2); cluster = 3;
% M = [0.4,0.28,0.3,0.02;
%      0.01,0.9,0.08,0.01;
%      0.63,0.06,0.01,0.3;
%      0.6,0.09,0.01,0.3;
%      0.6,0.09,0.01,0.3;];

%% Data Set from 
% Multi-sensor data fusion based on the belief divergence measure of
% evidences and the belief entropy

%  G = [1,0,0;0,1,0;0,0,1;1,0,1];
%  F = sum(G,2);cluster = 3;
%  M = [0.41,0.29,0.3,0;
%       0,0.9,0.1,0;
%       0.58,0.07,0,0.35;
%       0.55,0.10,0,0.35;
%       0.6,0.1,0,0.3;];
 
% G = [1,0,0;0,1,0;0,1,1;1,1,1];
% F = sum(G,2);cluster = 3;
% M = [0.6,0.1,0.1,0.2;0.05,0.8,0.05,0.10;0.7,0.1,0.1,0.1;];

%% Data Set from
% An Improved Multi-Source Data Fusion Method
% Based on the Belief Entropy and Divergence Measure

% G = [1,0,0;0,1,0;0,0,1;1,0,1];
% F = sum(G,2);cluster = 3;
% M = [0.41,0.29,0.3,0;
%      0,0.9,0.1,0;
%      0.58,0.07,0,0.35;
%      0.55,0.1,0,0.35;
%      0.6,0.1,0,0.3;];
%% Build Similarity Matrix
blsm = ones(size(M,1),size(M,1));
for i = 1:size(M,1)
    for j = 1:size(M,1)
        MM = 0;
        if j == i
            continue
        else
            m1 = M(i,:);m2 = M(j,:);
            for k = 1:length(F)
                MM = MM + abs(m1(k)/(2^F(k)-1) - m2(k)/(2^F(k)-1)) * 0.5;
            end
            blsm(i,j) = log2(2-MM);
        end
    end
end

%% Calculate average similarity
cre = zeros(1,size(M,1));
for i = 1:size(M,1)
    temp = (sum(blsm(i,:))-1)/(size(M,1)-1);
    cre(i) = temp;
end
cre = cre./sum(cre);cre = repmat(cre',[1,size(M,2)]);  


%% Calculate the information volume
Deng =zeros(size(M,1),1);
for i = 1:size(M,1)
    E_d = 0;
    for j = 1:size(M,2)
        if M(i,j)~=0
        E_d = E_d + M(i,j)*log2(M(i,j)/(2^F(j)-1));
        end
    end
    Deng(i) = -E_d;
end
IV = exp(Deng);
IV = IV./sum(IV);
%% Calculate the information volume
% Deng =zeros(size(M,1),1);
% for i = 1:size(M,1)
%     E_d = 0;
%     for j = 1:size(M,2)
%         temp = 0;
%         for k = 1:size(G,1)
%             if k~=j
%                 temp = temp + sum(G(j,:).*G(k,:))/(2^size(M,2)-1);
%             end
%         end
%         if M(i,j)~=0
%             E_d = E_d + M(i,j)*log2((M(i,j)/(2^F(j)-1))*exp(temp));
%         end
%     end
%     Deng(i) = -E_d;
% end
% IV = exp(Deng);
% IV = IV./sum(IV);

%% Fuse the weight
ACrd = cre.*IV;
ACrd = ACrd ./sum(ACrd);
M_bar = sum(M.*ACrd);
M = repmat(M_bar,[size(M,1),1]);
%% classical D-S Fusion
% res = M(1,:);
% for i = 2:size(M,1)
%     K = 0;
%     A = zeros(1,size(M,2));
%     for j = 1:size(M,2) % 计算第j列交集的信任值
%         for k = 1:size(M,2)
%             flag = G(j,:) .* G(k,:);
%             if sum(flag) >=1
%                 for p = 1:size(G,1)
%                     if sum(flag==G(p,:))==3 %找到完全匹配的类别进行计算
%                         A(p) = A(p) + res(j)*M(i,k);
%                         break % 每次只会唯一对应一个
%                     end
%                 end
%             elseif sum(flag)==0 %交集完全为空的类别计算K
%                 K = K + res(j)*M(i,k);
%             end
%         end
%     end
%     res = 1/(1-K).*A;
% end

%% D-S Fusion with average weighted evidence
res = M(1,:);res_step = [];
for i = 2:size(M,1)
    K = 0;
    A = zeros(1,size(M,2));
    for j = 1:size(M,2) % 计算第j列交集的信任值
        for k = 1:size(M,2)
            flag = G(j,:) .* G(k,:);
            if sum(flag) >=1
                for p = 1:size(G,1)
                    if sum(flag==G(p,:))== cluster %找到完全匹配的类别进行计算
                        A(p) = A(p) + res(j)*M(i,k);
                        break % 每次只会唯一对应一个
                    end
                end
            elseif sum(flag)==0 %交集完全为空的类别计算K
                K = K + res(j)*M(i,k);
            end
        end
    end
    res = 1/(1-K).*A;
    res_step = [res_step;res];
end
