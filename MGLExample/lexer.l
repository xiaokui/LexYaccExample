%{

#include <stdio.h>
#include <math.h>
#include "parser.h"

int lineno;


%}

ws [ \t]+
nl \n


%%

{ws} ;
command {return COMMAND;}
{nl} {lineno++;}
. { return yytext[0];}


%%


int yywrap(void) {
     return 1;
     }


