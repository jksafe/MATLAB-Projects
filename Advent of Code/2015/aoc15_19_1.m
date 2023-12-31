function [counts,unique_mols]=aoc15_19_1(subs,base)
unique_mols=[string(base)];
counts=[];
for i1=1:length(subs)
    findx=char(subs(i1,1));
    replacex=char(subs(i1,2));

    locs=strfind(base,findx);

    if isempty(locs)==1
        counts=[counts;0];
        continue;
    else
        for i2=1:length(locs)
            new=[base(1:locs(i2)-1),replacex,base(locs(i2)+length(findx):end)];
            unique_mols=[unique_mols;string(new)];
        end
        counts=[counts;length(locs)];
    end
end
end
