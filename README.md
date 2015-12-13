##nhuff 

I implemented those three huffmancoding functions as part of a digital telecommunications course. I used Octave, because the assignment had to be explicitly implemented in Matlab or Octave. As I cannot afford to buy Matlab I chose Octave. 

I tried to maintain as much compatibillity as possible between my implementation and mathworks specifications for those functions. 

###usage
```
dict = myhuffmandict(symbols, p)
```
Receives a list of distinct __symbols__  along with a vector __p__ of corresponding probabillities and outputs a two-column cell array where column-1 stores the symbols and column-2 their corresponding Huffman code. The symbols can be represented either as a cell array or as a numeric vector. The size of p must match the number of symbols. 

```
comp = myhuffmanenco(sig, dict)
```
Encodes the signal sig using the Huffman codes described by the code dictionary dict. sig, must have the form of a numeric vector. dict, must have the form described above. comp is the resulting endocing of sig.

```
dsig = huffmandeco(comp,dict)
```
Decodes the numeric Huffman code vector comp using the code dictionary dict. dsig must the same as the original signla sig.

#####note
As a convention the probabilities don't have to add up to exactly 1. In this sense the values in vector p can be characterized more as importance weights rather than probabilities. Though, for achieving best compression ratio it is better to adjust the weights so that they do add up to 1.


