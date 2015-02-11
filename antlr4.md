### Configure Antlr4

#####1. Set Alias for Antlr4

#####2. Write the grammar file

#####3. Generate parser and lexer
use command antlr4 Hello.g4
create new application base on it

#####4. Set Alias for TestRig(Grun)

#####5. Test
    $ grun Hello r -tokens # at rule r and output a list of tokens # or use -tree
    hello hanwen
    eof #type ctrl-d on unix or ctrl-z in windows

#####6. Give it a input file
    $ grun Hello r -gui input # and then write a file named input it will be cool!
