# Overview

In my exploration to understanding the Erlang language I wrote a program that decodes lists of binary numbers into letters. Prior to developing this code, I learned about Erlang along-side someone else who had a college course in Erlang and was struggling in the class (although note that this software in particular was entirely created by myself). What this software does is it takes in a list of binary numbers, takes the head of the list and appends it to another list,and takes that other list through a case statement to see if the binary matches and of the letter cases. If the binary does match one of the cases, the result of the case is added appended to another list and the second list will be cleared (through recursion). This process will recur through the entire list of binary list of binary. Once the entire list is recurred through, each element of the third list will be showed in the console. What this program also does is it can take in the binary and use a mapping function to make the inverse of the binary and print out what the output of letters would be with the inverse of the binary. Lastly, this program can also generate all permutations of binary lists that are nine letters long and show what each of the permutations would be decoded. The key that is being used to decode the binary to characters was generated using a huffman tree. I found that learning this language was quite beneficial I found it to be quite different from some of the other languages I already know.

[Software Demo Video](https://youtu.be/J46NPx0WoM4)

# Development Environment

* Visual Studio Code
* Erlang (version 25)

# Useful Websites

* [Official Erlang Documentation](https://www.erlang.org/docs)
* [Tutorialspoint](https://www.tutorialspoint.com/erlang/index.htm)
* [Stack Overflow](https://stackoverflow.com/questions/34179283/permutations-example-in-erlang)

# Future Work

{Make a list of things that you need to fix, improve, and add in the future.}

* when making permutations of binary, make the size of each of the permutation length adjustable (not just being limited to a length of nine)
* making a binary decoding key for the whole alphabet
* make a function that will convert a string of letters to a list of binary