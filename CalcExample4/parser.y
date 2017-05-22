
%{

#include <stdio.h.>
#include "SymbolTable.h"

extern int yylex(void);
void yyerror(const char *s);


%}

%union {
    double dval;
    struct symtab *symp;
}


%token <symp> NAME
%token <dval>  NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%type <dval> expression
%%

statement_list: statement '\n'
    | statement_list statement '\n'
    ;

statement: NAME '=' expression { $1->value = $3; }
    |   expression {printf("= %g\n", $1); }
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
    |   '(' expression ')' { $$ = $2; }
    |   NUMBER
    |   NAME    { $$ = $1->value; }
    |   NAME '(' expression ')' {
            if ($1->funcptr)
                $$ = ($1->funcptr)($3);
            else
            {
                printf("%s not a function\n", $1->name);
                $$ = 0.0;
            }
    }
    ;

%%

void yyerror(const char *s)
{
    printf("error: %s", s);
}



