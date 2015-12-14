function dict = myhuffmandict(symbols, p)

[~, n] = size(symbols);
[~, idx] = sort(-p);

% initialize adjacency list as a cell array
% col 1 symbol,2 propabilities,3 flag ,4-5 children nodes,6 code
adjList = cell(n,6);
for i = 1:n
    adjList(i,1) = symbols(i);
end
adjList(:,2) = num2cell(p);

% sort cell array based on propabilities
adjList = adjList(idx,:);
adjList(:,3) = 'f';

% auxiliary function to determine ending condition
function flag = finish(flagCol)
    flag = 't';
    flagCol = cell2mat(flagCol);
    for i = 1:n-1
        if flagCol(i) == 'f'
            flag = 'f';
        end
    end
end

% recursive function to traverse the tree and assign edge weights
function traverse(root)
    leftChild = cell2mat(adjList(root,5));
    rightChild = cell2mat(adjList(root,4));

    if isempty(leftChild) == 0
        adjList(leftChild,6) = [cell2mat(adjList(root,6)) 0];
        traverse(leftChild)
    end
    if isempty(rightChild) == 0
        adjList(rightChild,6) = [cell2mat(adjList(root,6)) 1];
        traverse(rightChild)
    end
end

flag = finish(adjList(:,3));
while flag == 'f'
    % find the two indexes corresponding to the symbols with the smallest values
    [~, idx] = sort(cell2mat(adjList(:,2)));
    for i = 1:n
        if char(adjList(idx(i),3)) == 'f'
            min1 = idx(i);
            break
        end
    end
    for i = 1:n
        if char(adjList(idx(i),3)) == 'f' && idx(i) != min1
            min2 = idx(i);
            break
        end
    end
    % create new node
    n += 1;
    adjList(n,1) = cell2mat(adjList(min1,2)) + cell2mat(adjList(min2,2));
    adjList(n,2) = cell2mat(adjList(min1,2)) + cell2mat(adjList(min2,2));
    adjList(n,3) = 'f';
    adjList(n,4) = min2;
    adjList(n,5) = min1;
    adjList(min1,3) = 't';
    adjList(min2,3) = 't';

    flag = finish(adjList(:,3));
end
% traverse the tree and assign edge weights
traverse(n);

n = (n+1)/2;
dict = cell(n,2);
dict(:,1) = adjList(1:n,1);
dict(:,2) = adjList(1:n,6);

end
