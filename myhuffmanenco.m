function comp = myhuffmanenco(sig, dict) %sig can be a numeric vector (row or col) or a cell aray
if iscell(sig)
    type = 'c';
else
    type = 'v';
end
[n1, n2] = size(sig);
if n1 > n2
    n = n1;
else
    n = n2;
end
dictSize = size(dict,1);

comp = [];
function code = getCode(value)
if type == 'c'
    value = cell2mat(value);
end
for j = 1:dictSize
    if cell2mat(dict(j,1)) == value
        code = cell2mat(dict(j,2));
        break;
    end
end
end
i = 1;
k = 1;
while i <= n
    code = getCode(sig(i));
    codeSize = size(code, 2);
    comp(k:k+(codeSize-1)) = code;
    k = k + codeSize;
    i += 1;
end
    
end
