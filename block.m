function [outp]= block(I)

kk=0;
for i=1:2
    for j=1:2
        feature(:,:,kk+j)=(I((127*(i-1)+1:127*(i-1)+127),(150*(j-1)+1:150*(j-1)+150)));
    end
    kk=kk+(2);
end
outp=feature;
end
 