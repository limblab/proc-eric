function explained = add_var_explained(explained)

explained(1,2) = explained(1,1);

for i = 2:length(explained)
    explained(i,2) = explained(i-1,2) + explained(i,1);
end