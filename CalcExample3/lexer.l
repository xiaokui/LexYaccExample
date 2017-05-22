%{

#include <stdio.h>
#include <math.h>

#include "parser.h"

//extern int yylval;
extern double vbltable[26];

%}

%%
([0-9]+|[0-9]*\.[0-9]+) { yylval.dval = atof(yytext); return NUMBER; }
[ \t]   ;

[a-z] { yylval.vblno = yytext[0]-'a'; return NAME;}

"$" { return 0; }

\n |
. {  return yytext[0];}

%%


int yywrap(void) {
     return 1;
     }


