function [all,o,x,y]=aoc23_10_1(in)
o=zeros(size(in));
all={};
all{end+1}=o;
x=[];
y=[];

start=find(in=='S');
[sRow,sCol]=ind2sub(size(in),start);
x=[x;sCol];
y=[y;sRow];
pRow=sRow;
pCol=sCol;
aRow=sRow;
aCol=sCol-1;
%aCol=sCol+1;
t=1;
o(start)=1;
all{end+1}=o;



while (aRow~=sRow || aCol~=sCol)
    %o(aRow,aCol)=t;
    x=[x;aCol];
    y=[y;aRow];
    o(aRow,aCol)=1;
    all{end+1}=o;
    aVal=in(aRow,aCol);

    switch aVal
        case 'L'
            if aRow==pRow+1
                pCol=aCol;
                aCol=aCol+1;
                pRow=aRow;
            elseif aCol==pCol-1
                pRow=aRow;
                aRow=aRow-1;
                pCol=aCol;
            end
        case 'J'
            if aCol==pCol+1
                pRow=aRow;
                aRow=aRow-1;
                pCol=aCol;
            elseif aRow==pRow+1
                pCol=aCol;
                aCol=aCol-1;
                pRow=aRow;
            end
        case '7'
            if aCol==pCol+1
                pRow=aRow;
                aRow=aRow+1;
                pCol=aCol;
            elseif aRow==pRow-1
                pCol=aCol;
                aCol=aCol-1;
                pRow=aRow;
            end
        case 'F'
            if aRow==pRow-1
                pCol=aCol;
                aCol=aCol+1;
                pRow=aRow;
            elseif aCol==pCol-1
                pRow=aRow;
                aRow=aRow+1;
                pCol=aCol;
            end
        case '-'
            if pCol>aCol
                pCol=aCol;
                aCol=aCol-1;
            elseif pCol<aCol
                pCol=aCol;
                aCol=aCol+1;
            end
        case '|'
            if pRow>aRow
                pRow=aRow;
                aRow=aRow-1;
            elseif pRow<aRow
                pRow=aRow;
                aRow=aRow+1;
            end
    end
    t=t+1;
    end
end

