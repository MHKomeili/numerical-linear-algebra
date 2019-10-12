function [L, U] = lu(A)
    [n,n1]=size(A);
    if n ~= n1
        printf("Invalid input dimantion!");
        return
    end
    U(1,:)=A(1,:);
    L = diag(ones(1,n));
    L(2:n,1)=A(2:n,1)/U(1,1);

    for k=2:n
        for j=k:n 
            U(k,j)=A(k,j)-sum(L(k,1:k-1).*U(1:k-1,j))
        end
        for i=k+1:n
            L(i,k)=(A(i,k)-sum(L(i,1:k-1).*U(1:k-1,k)))/U(k,k)
        end
    end

end







% % LU Matrix decomposition algorithm
% % Author: Farhad Mehryari
% % Web: blog.mrfarhad.ir
% function [ L, U ] = lu(A)
% % A شرط بررسی مربعی بودن ماتریس 
% sz = size(A);
% if sz(1)~=sz(2)
%     fprintf('A is not square !\n');
%     clear x;
%     return;
% end
% n = sz(1);
% L = eye(n); 
% P = eye(n);
% U = A;
% for i=1:sz(1)
%     % کاهش سطری    
%     if U(i,i)==0
%         maximum = max(abs(U(i:end,1)));
%         for k=1:n
%            if maximum == abs(U(k,i))
%                temp = U(1,:);
%                U(1,:) = U(k,:);
%                U(k,:) = temp;
 
%                temp = P(:,1);
%                P(1,:) = P(k,:);
%                P(k,:) = temp;
%            end
%         end
 
%     end
%     if U(i,i)~=1
%         temp = eye(n);
%         temp(i,i)=U(i,i);
%         L = L * temp;
%         U(i,:) = U(i,:)/U(i,i); % بررسی اینکه محور ها الزاما یک باشند
%     end
%     if i~=sz(1)
%         for j=i+1:length(U)
%             temp = eye(n);
%             temp(j,i) = U(j,i);
%             L = L * temp;
%             U(j,:) = U(j,:)-U(j,i)*U(i,:);
 
%         end
%     end
% end
% end
% % Author: Farhad Mehryari
% % Web: blog.mrfarhad.ir
