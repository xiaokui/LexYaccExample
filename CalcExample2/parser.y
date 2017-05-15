
%{

#include <stdio.h.>

extern int yylex(void);
void yyerror(const char *s);

%}


%token NAME NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%%

statement: NAME '=' expression
    |   expression {printf("= %d\n", $1); }
    ;

expression: expression '+' expression { $$ = $1 + $3;  }
    |   expression '-' expression { $$ = $1 - $3; }
    |   expression '*' expression { $$ = $1 * $3; }
    |   expression '/' expression
            {
                if ($3 == 0)
                    yyerror("divide by zero");
                else
                    $$ = $1/$3;
            }

    |   '-' expression %prec UMINUS { $$ = -$2; }
    |   NUMBER              { $$ = $1;  }
    ;

%%

void yyerror(const char *s)
{
    printf("error: %s", s);
}



