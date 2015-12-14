% testing with probability model based on content of file
clear

symbols = {'a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'};

sigB = {};
fstream = fopen('kwords.txt');

sigB(1) = fgetl(fstream);
while ~feof(fstream)
    sigB(size(sigB,2)+1) = lower(fgetl(fstream));
end
sigB = cell2mat(sigB);
%manually remove symbols that don't belong in the alphabet (e.g. '-','=')
sigB(regexp(sigB,'[^a-z]')) = [];

symbols(:,2) = 0;
for i = 1:size(sigB,2)
    idx = find(cell2mat(symbols(:,1))==sigB(i));
    symbols(idx,2) = cell2mat(symbols(idx,2)) + 1;
end
total = sum(cell2mat(symbols(:,2)));
for i = 1:26
    symbols(i,2) = cell2mat(symbols(i,2))/total;
end

% create signal based on calculated probabilities
dictB = myhuffmandict(symbols(:,1)', cell2mat(symbols(:,2))');

% encode signal based on dictA
compB = myhuffmanenco(sigB, dictB);
compBSize = size(compB,2);
disp(sprintf('Signal B encoded, size of encoding %g characters', compBSize));

% decode signal using dictB
dsigB = myhuffmandeco(compB, dictB);
disp('Signal B decoded')

if strcmp(sigB, cell2mat(dsigB))
    disp('No errors found')
else
    disp('Something is going wrong')
end
