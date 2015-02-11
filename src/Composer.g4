/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar Composer;

prog: (stat)+;

stat:   declare NEWLINE {System.out.println("create expression");}
    |   connect NEWLINE {System.out.println("connect expression");}
    |   NEWLINE {System.out.println("empty or comment line");}
    ;

declare: ID '=' function {System.out.println("assign expr is " + $text);};

    function: ID '(' parameter? ')';

    parameter: INT | STRING;

connect: port CONNECT port {System.out.println("connect expr is " + $text);};

    port: ID '.' ID;

    CONNECT : '->';

ID
    : [a-zA-Z_] [a-zA-Z_0-9]* ;   // match identifiers <label id="code.tour.expr.3"/>

INT
    :   [0-9]+ ;         // match integers

/** Newline ends a statement */
NEWLINE
    :'\r'? '\n' ;     // return newlines to parser (is end-statement signal)

/** Warning: doesn't handle INDENT/DEDENT Python rules */
WS
    :   [ \t]+ -> skip ; // toss out whitespace

/** Match comments. Don't match \n here; we'll send NEWLINE to the parser. */
COMMENT
    :    '#' ~[\r\n]* -> skip
    ;
/** Match strings, not match escape chars */
STRING: '"' (ESC|.)*? '"';

fragment
ESC : '\\"' | '\\\\'; // 2-char sequences \" and \\

