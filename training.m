load audio y

for i=1:5
v{i} = feature_vector_V2(y(1,:));

C{i}  = LBG(v{i});

end

save dictionary C
