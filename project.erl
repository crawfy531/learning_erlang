-module(project).
-export([decode_binary/3,decode_letter/1,display_list_elements/1,generate_permutations/0,decode_permutations/1,display_permutations_inverse/1,start/0]).

% this takes in a list of binary and two empty lists
% it then iterates through the list and adds each of the binary numbers to current
% if when decoded the current list returns a character, that character is then added to the Letters List and the Current list is cleared
% this continues throughout the binary list and when it has gone through the list , the elements in the Letters list will be displayed

decode_binary([H|T],Current,Letters) when H /= [] ->
    Currentletter = decode_letter(Current),
    UpdatedCurrent = lists:append(Current,[H]),
    % io:fwrite("~w~n",[Current]),
    if 
        Currentletter == unknown ->
            decode_binary(T, UpdatedCurrent,Letters);
        true ->
            UpdatedLetters = lists:append(Letters,[Currentletter]),
            decode_binary([H|T],[],UpdatedLetters) end;


decode_binary(_,Current,Letters) ->
    Currentletter = decode_letter(Current),
    UpdatedLetters = lists:append(Letters,[Currentletter]),
    display_list_elements(UpdatedLetters)
    .

% this takes in a list of binary and returns the matching case (either a character or the atom unknown)
decode_letter(List) ->
    case List of
        [1,1,1,1] -> "t";
        [1,1,1,0,1] -> "w";
        [1,1,1,0,0,1] -> "h";
        [1,1,1,0,0,0] -> "m";
        [1,1,0,1] -> "e";
        [1,1,0,0,1] -> "k";
        [1,1,0,0,0,1] -> "y";
        [1,1,0,0,0,0] -> "x";
        [1,0] -> "i";
        [0,1] -> " ";
        [0,0,1,1] -> "s";
        [0,0,1,0,1] -> "r";
        [0,0,1,0,0,1] -> "p";
        [0,0,1,0,0,0] -> "a";
        [0,0,0,1,1] -> "o";
        [0,0,0,1,0,1] -> "j";
        [0,0,0,1,0,0] -> "c";
        [0,0,0,0,1] -> "n";
        [0,0,0,0,0,1] -> "d";
        [0,0,0,0,0,0] -> "g";
        _ -> unknown
        
    end.

% this takes the list of the result of decoding binary and displays each result unless the result is the atom unknown in which it will stop the function
display_list_elements([H|T]) when H /= [] ->
    if H /= unknown ->
        io:format(H),
        display_list_elements(T);
    true ->
        T
    end
    ;
display_list_elements(List) ->
    List
    .
% takes in a binary list and switches each of the values in the list (from 1 to 0 and 0 to one)
inverse_of_binary(List) ->
    Inverse = lists:map(fun(X) -> (X * -1) + 1 end,List),
    decode_binary(Inverse,[],[])
    .
% generates a list of binary lists which are all the permutarions that are 9 long
generate_permutations() ->
    [[A,B,C,D,E,F,G,H,I] || A <- [1,0], B <- [1,0], C <- [1,0] , D <- [1,0], E <- [1,0], F <- [1,0], G <- [1,0], H <- [1,0], I <- [1,0]]
    .

% takes in a list of lists and for each list it decodes the binary list
% each decoded binary phrase will be separated by a "|""
decode_permutations([H|T]) when H /= [] ->
    decode_binary(H,[],[]),
    io:format("|"),
    decode_permutations(T)
;
decode_permutations(_)->
    done
    .

% takes in a list of lists and for each list it decodes the inverse of the binary list
% each decoded binary phrase will be separated by a "|""
display_permutations_inverse([H|T]) when H /= [] ->
    inverse_of_binary(H),
    io:format("|"),
    display_permutations_inverse(T)
    ;
display_permutations_inverse(_)->
    done
    .

% runs all of the functions in the program
start() ->
    Binary = [1,1,1,1,1,1,1,0,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,1,1,0,0,0,1,1,0,0,0,1,0,1,0,0,1,0,0,1,0,0,1,0,1,0,0,0,1,1,0,0,0,1,0,1,1,1,0,1,0,0,0,1,0,0,1,1,1,1,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,1,0,1,1,1,1,0,1,1,0,0,0,1,1,0,1,1,1,1,0,1,0,0,0,1,1,0,0,1,0,1,1,1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0],
    io:format("This project decodes binary to make characters. Here is an example ~n"),
    io:format("~n"),
    decode_binary(Binary,[],[]),
    io:format("~n"),
    io:format("~n"),
    io:format("Here is what the inverse looks like ~n"),
    io:format("~n"),
    inverse_of_binary(Binary),
    io:format("~n"),
    io:format("~n"),
    io:format("Here is what all posibilites of a length of 5 binary look like when decoded~n"),
    io:format("~n"),
    Permutarions = generate_permutations(),
    decode_permutations(Permutarions),
    io:format("~n"),
    io:format("~n"),
    io:format("Here is what the inverse of all those posibilities look like~n"),
    io:format("~n"),
    display_permutations_inverse(Permutarions),
    io:format("~n")
    .

% program purpose: decode 1s and 0s using a huffman tree (preconstructed)
% the first result should be "this is my project and it is working"
%  1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 
% "this" 1,1,1,1,1,1,1,0,0,1,1,0,0,0,1,1
% "is" 1,0,0,0,1,1
% "my" 1,1,1,0,0,0,1,1,0,0,0,1
% "week" 1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,0,1
% "six" 0,0,1,1,1,0,1,1,0,0,0,0
% "project" 0,0,1,0,0,1,0,0,1,0,1,0,0,0,1,1,0,0,0,1,0,1,1,1,0,1,0,0,0,1,0,0,1,1,1,1
% "and" 0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1
% "it" 1,0,1,1,1,1
% "is" 1,0,0,0,1,1
% "working" 1,1,1,0,1,0,0,0,1,1,0,0,1,0,1,1,1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0
% ; here is the key:
% ; 1111 = t
% ; 11101 = w
% ; 111001 = h
% ; 111000 = m
% ; 1101 = e
% ; 11001 = k
% ; 110001 = y
% ; 110000 = x
% ; 10 = i
% ; 01 = [space]
% ; 0011 = s
% ; 00101 = r
% ; 001001 = p
% ; 001000 = a
% ; 00011 = o
% ; 000101 = j
% ; 000100 = c
% ; 00001 = n
% ; 000001 = d
% ; 000000 = g