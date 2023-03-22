function result=distance2(C,X)
%We assume C to be a 1x5 cell where each entry is a 10x4 feature matrix
% for a,e,i,o,u respectively

% equation for distance for two points: d = sum((x-y).^2).^0.5
% since sum sums along columns, and in our case each column is a separate
% point, not passing the row argument into the sum function is justified.
% We square root each ennty of row vector to get distances for each point
% Then we get average distance with mean
% Possible modifications: use sum instead of mean

for i=1:length(C)
    dis(i)=mean(sum((C{i}-X).^2).^0.5);
    
end

vowels={'a','e','i','o','u'};

[~,ind]=min(dis);

result=vowels{ind};

end