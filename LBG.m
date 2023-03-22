function M=LBG(v) 

%v=rescale(v);


[A1,A2]=mmsplit(v);

[A3,A4]=mmsplit(A1);

[A5,A6]=mmsplit(A2);

A={A3,A4,A5,A6};

M=zeros(10,4);
for i=1:4
    M(:,i)=mean(A{i},2);
end





function [A1,A2]=mmsplit(v)



[~,n]=size(v);
M=distmean(v);

d=mdist(v,M);

t=median(d);

count1=0;
count2=0;

for i=1:n
    if d(i)<t
        count1=count1+1;
        A1(:,count1)=v(:,i);
    else
        count2=count2+1;
        A2(:,count2)=v(:,i);
    end
end







end

function M=distmean(v)



[m,~]=size(v);

M=mean(v,2);
M=[M+rand(m,1),M+rand(m,1)];


end

function d=mdist(v,M)

[~,n]=size(v);

for i=1:n
d(i)=sum((v(:,i)-M(1)).^2).^0.5;%
end

end
end

