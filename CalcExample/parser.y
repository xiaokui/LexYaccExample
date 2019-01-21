
%{

#include <stdio.h.>

extern int yylex(void);
void yyerror(const char *s);

%}


%token NAME NUMBER

%%

statement: NAME '=' expression
    |   expression {printf("exp = %d\n", $1); }
    ;

expression: expression '+' NUMBER { $$ = $1 + $3;  }
    |   expression '-' NUMBER { $$ = $1 - $3; }
    |   NUMBER              { $$ = $1;  }
    ;


%%

void yyerror(const char *s)
{
    printf("error: %s", s);
}



