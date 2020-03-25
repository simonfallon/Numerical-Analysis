clc
format shortg
Ae = ;              %INPUT MATRIX OF LIN EQ. SYSTEM
be = [];            %INPUT RIGHT PART OF LIN EQ. SYSTEM
A = [Ae be];
fprintf('Phase 0\n');
A
for i = 1:length(A)-2
    maxrow = find(abs(A(i:end,i))==max(abs(A(i:end,i))))+i-1;
    A([i maxrow],:)=A([maxrow i],:);
    for j = i+1:length(A)-1
        A(j,:) = A(j,:)-A(i,:)*A(j,i)/A(i,i);
    end
    fprintf('Phase %d\n',i);
    A
end

%Regressive Substitution
for i = length(A)-(1:length(A)-1)
    for j = length(A)-(1:length(A))
        if i == j
            A(i,:) = A(i,:)/A(i,i);
        end
        if i<j
            A(i,:) = A(i,:)-A(j,:)*A(i,j);
        end
        
    end
end
fprintf('After applying regressive Substitution\n');
x = A(:,end)