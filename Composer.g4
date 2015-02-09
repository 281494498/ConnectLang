/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar Composer;

stat:   assign NEWLINE {console.log("create new");}
    |   connect NEWLINE {console.log("connect new");}                  
    ;

assign: ID '=' expr {console.log("assign expr is" + $expr.text);};

connect: expr CONNECT expr {console.log("connect expr is" + $expr.text);};

expr:;

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
