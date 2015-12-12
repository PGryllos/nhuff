function comp = myhuffmanenco(sig, dict) %sig must be a numeric vector (row or col)
[n1, n2] = size(sig);
if n1 > n2
    n = n1;
else
    n = n2;
end
dictSize = size(dict,1);

comp = [];
function code = getCode(value)
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
