clc
format shortg
Ae = [];              %INPUT MATRIX OF LIN EQ. SYSTEM
be = [];              %INPUT RIGHT PART OF LIN EQ. SYSTEM
A = [Ae be];
A(end+1,:) = 1:length(A); %To keep track of the variable´s indices
fprintf('Phase 0\n');
A(1:end-1,:)
for i = 1:length(A)-2
    maxitem = max(max(abs(A(i:end,i:end-1))));
    [a, b] = find(maxitem == abs(A));
    A([i a],:)=A([a i],:);
    A(:,[i b])=A(:,[b i]);
    for j = i+1:length(A)-1
        A(j,:) = A(j,:)-A(i,:)*A(j,i)/A(i,i);
    end
    fprintf('Phase %d\n',i);
    A(1:end-1,:)
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
fprintf('After appyling regressive Substitution\n');
A = A(A(end,:),A(end,:));
x = A(1:end-1,end)

