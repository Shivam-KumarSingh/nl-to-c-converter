/* lexer.l */
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

void yyerror(const char *s);
int line_num = 1;

/* Add these lines to suppress warnings */
#define YY_NO_INPUT
#define YY_NO_UNPUT
%}

%%
"print"                         { return PRINT; }

"for"				{return FOR;}
"in"				{return IN;}
"range"				{return RANGE;}
"declare"                       { return DECLARE; }
"take"				{return TAKE;}
"user"				{return USER;}
"input"				{return INPUT;}
"set"                          { return SET; }
"add"                          { return ADD; }
"subtract"                     { return SUBTRACT; }
"multiply"                     { return MULTIPLY; }
"divide"                       { return DIVIDE; }
"if"                          { return IF; }
"then"                        { return THEN; }
"while"                       { return WHILE; }
"do"                          { return DO; }
"is"                          { return IS; }
"of"			       {return OF;}
"size"			      {return SIZE;}
"greater"[ ]+"than"           { return GREATER; }
"less"[ ]+"than"             { return LESS; }
"equal"[ ]+"to"              { return EQUAL; }
"and"                         { return AND; }
"or"                          { return OR; }
"end"                         { return END; }
"integer"                     { return INTEGER_TYPE; }
"float"                       { return FLOAT_TYPE; }
"string"                      { return STRING_TYPE; }
"array"			      { return ARRAY_TYPE;}
"["              	      { return '['; }
"]"    			      { return ']'; }
[a-zA-Z][a-zA-Z0-9_]*        { yylval.string = strdup(yytext); return IDENTIFIER; }
[0-9]+                        { yylval.number = atoi(yytext); return NUMBER; }
[0-9]+\.[0-9]+               { yylval.decimal = atof(yytext); return DECIMAL; }
\"[^\"]*\"                    { yylval.string = strdup(yytext); return STRING; }
[ \t]                         ;
\n                           { line_num++; }
.                            { printf("Unknown character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
