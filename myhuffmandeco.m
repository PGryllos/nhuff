function dsig = myhuffmandeco(comp,dict) % comp must be a numeric vector (row or col)
dsig = {};
[n1, n2] = size(comp);
if n1 > n2
    n = n1;
else
    n = n2;
end
dictSize = size(dict,1);

function symbol = getSymbol(code)
symbol = NaN;
for j = 1:dictSize
    tmpCode = cell2mat(dict(j,2));
    tmpCodeSize = size(tmpCode, 2);
    codeSize = size(code, 2);
    if tmpCodeSize > codeSize
        break;
    end
    if codeSize == tmpCodeSize && tmpCode == code
        symbol = cell2mat(dict(j,1));
        break;
    end
end
end

beginning = 1;
ending = 1;
while ending < n
    symbol = getSymbol(comp(beginning:ending));
    while isnan(symbol)
        ending += 1;
        symbol = getSymbol(comp(beginning:ending));
    end
    dsig(size(dsig,2)+1) = symbol;
    if ending != n
        ending += 1;
        beginning = ending;
    end
end

end
