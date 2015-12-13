
% testing with random source and probability model taken from here https://en.wikipedia.org/wiki/Letter_frequency
clear

numerics = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26];

symbols = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'};

p = [.08167 .01492 .02782 .04253 .12702 .02228 .02015 .06094 .06966 .00153 .00772 .04025 .02406 .06749 .07507 .01929 .00095 .05987 .06327 .09056 .02758 .00978 .02361 .00150 .01974 .00074];

% generate dictionary that maps symbols with probabillities p to Huffman codes
dictA = myhuffmandict(symbols, p);
disp('Huffman dictionary created')

% create a sequence of random symbols based on a propability model
numSigA = randsrc(10000, 1, [numerics; p]);
sigA = {};

for i = 1:10000
    sigA(i) =  char(numSigA(i)+'a'-1);
end

% encode sigA based on dictA
compA = myhuffmanenco(sigA, dictA);
disp('Signal A encoded')

% decode signal using dictA
dsigA = myhuffmandeco(compA, dictA);
disp('Signal A decoded')

% check if the decodes signal matches the original
cmp = cellfun(@strcmp, sigA, dsigA);
if size(find(cmp),2) == 10000
    disp('No errors found')
else
    disp('Something is going wrong')
end

% testing on a given text filower(sigB(i))le with the same probabilities as previously
   %sigB = {};
   %fstream = fopen('kwords.txt');

   %sigB(1) = fgetl(fstream);
   %while ischar(char(sigB(size(sigB,2))))
   %    sigB(size(sigB,2)) = fgetl(fstream);
   %end
