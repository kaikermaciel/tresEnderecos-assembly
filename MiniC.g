/*
Alunos: 
- Kaike Ribas Maciel : 22250538
- Maria Vitória Costa do Nascimento : 22053592
- Rodrigo Santos Correa: 22251139
 */

grammar MiniC;

program : definition (definition)*;

definition: data_definition | function_definition;

data_definition : type declarator (',' declarator)* ';';

type 
        : 'int'
        | 'char'
        ;

declarator : IDENTIFIER;

function_definition : type? function_header function_body;

function_header : declarator parameter_list;

parameter_list : '(' (parameter_declaration)? ')';

parameter_declaration : type declarator (',' declarator)*;

function_body : '{' (data_definition)* (statement)* '}';

block : '{' (statement)* '}' ;

statement
        :  ifStat
        |   whileStat
        |   assignState
        |   exprStat
        |   block
        |   binary
        ;

ifStat : 'if' '(' expression ')' statement ('else' statement)? ;  
whileStat : 'while' '(' expression ')' statement ;
assignState : IDENTIFIER '=' (exprStat) ';' ;
exprStat : (expression) ';' ;

expression : IDENTIFIER '=' binary #assing
           | binary (',' binary)*  #binaryExp
           ;

binary
        : IDENTIFIER '+=' binary #Inc
        | IDENTIFIER '-=' binary #Dec
        | IDENTIFIER '*=' binary #Mult        
        | IDENTIFIER '/=' binary #Div
        | IDENTIFIER '%=' binary #Mod
        | binary '*' binary #Relational
        | binary '/' binary #Relational
        | binary '+' binary #Relational
        | binary '-' binary #Relational
        | binary '==' binary #Relational
        | binary '!=' binary #Relational
        | binary '<' binary #Relational
        | binary '<=' binary  #Relational
        | binary '>' binary #Relational
        | binary '>=' binary #Relational
        | binary '%' binary #Relational
        | unary #UnaryBin
        ;

unary 
        : '++' IDENTIFIER 
        | '--' IDENTIFIER 
        | primary
        ;

primary 
        : IDENTIFIER 
        | CONSTANT_INT 
        | CONSTANT_CHAR 
        |'(' expression ')' 
        | IDENTIFIER '(' (argument_list)? ')'
        ;

argument_list : binary (',' binary)* ;

IDENTIFIER : [a-zA-Z] [a-zA-Z0-9_]* ;

CONSTANT_INT: [0-9]+;

CONSTANT_CHAR: '\'' [a-zA-Z]+ '\'';


WS : [ \t\r\n]+ -> skip ;
