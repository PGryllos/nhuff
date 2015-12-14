clear
numerics = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26];

symbols = {};

p = [.08167 .01492 .02782 .04253 .12702 .02228 .02015 .06094 .06966 .00153 .00772 .04025 .02406 .06749 .07507 .01929 .00095 .05987 .06327 .09056 .02758 .00978 .02361 .00150 .01974 .00074];

function idx = findIn(string, symbols)
idx = NaN;
for k = 1:size(symbols,2)
    if strcmp(string, cell2mat(symbols(1,k)))
        idx = k;
        break;
    end
end
end
% create a sequence of random symbols based on a propability model
numSigA = randsrc(10000, 1, [numerics; p]);
sigA = {};

for i = 1:10000
    sigA(i) =  char(numSigA(i)+'a'-1);
end
i = 1;
j = 2;
while j <= 10000
    idx = findIn(cell2mat(sigA(i:j)), symbols);
    if isnan(idx)
        symbols(size(symbols,2)+1) = cell2mat(sigA(i:j));
    end
    i += 1;
    j += 1;
end

symbols(2,:) = 0;

i = 1;
while i <= 10000
    idx = findIn(cell2mat(sigA(i:i+1)), symbols);
    symbols(2,idx) = cell2mat(symbols(2,idx)) + 1;
    i += 2;
end

total = sum(cell2mat(symbols(2,:)));
for i = 1:size(symbols, 2)
    symbols(2,i) = cell2mat(symbols(2,i))/total;
end

dictC = myhuffmandict(symbols(1,:), cell2mat(symbols(2,:)))
