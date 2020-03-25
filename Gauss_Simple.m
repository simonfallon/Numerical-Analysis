clc
format shortg
Ae = [];              %INPUT MATRIX OF LIN EQ. SYSTEM
be = [];              %INPUT RIGHT PART OF LIN EQ. SYSTEM
A = [Ae be];
fprintf('Phase 0\n');
A
for j = 1:length(A)-2
    for i = 1:length(A)-1
        if i>j
            A(i,:) = A(i,:)-A(j,:)*A(i,j)/A(j,j);
        end
    end
    fprintf('Phase %d\n',j);
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
fprintf('After applying regressive substitution\n');
x = A(:,end)