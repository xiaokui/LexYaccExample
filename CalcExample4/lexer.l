%{

#include <stdio.h>
#include <math.h>
#include "SymbolTable.h"
#include "parser.h"

%}

%%
([0-9]+|[0-9]*\.[0-9]+) { yylval.dval = atof(yytext); return NUMBER; }
[ \t]   ;

[a-zA-Z][A-Za-z0-9]* {
    yylval.symp = symlook(yytext);
    return NAME;
}

"$" { return 0; }

\n |
. {  return yytext[0];}

%%


int yywrap(void) {
     return 1;
     }


