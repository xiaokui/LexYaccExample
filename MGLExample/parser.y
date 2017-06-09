
%{

#include <stdio.h.>

extern int yylex(void);
void yyerror(const char *s);

%}

%token COMMAND
%%

start: COMMAND
       ;

%%

void yyerror(const char *s)
{
    printf("error: %s", s);
}



