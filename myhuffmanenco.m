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
idx = find(cell2mat(dict(:,1))==value);
if ~isempty(idx)
    code = cell2mat(dict(idx,2));
else
    code = NaN;
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
