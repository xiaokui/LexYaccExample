
%{

#include <stdio.h>

extern int yylex(void);
void yyerror(const char *s);

void do_id(const char *s);

%}

%union {
    char *string;
};

%token COMMAND ACTION IGNORE EXECUTE ITEM TITLE SCREEN
%token <string> QSTRING ID
%%
start: titles items
       ;
titles:
        | titles title
        ;
title:  TITLE QSTRING
        ;

items: /* empty */
        | items item
        ;

item: ITEM QSTRING command action
        ;

command: COMMAND
        | COMMAND ID { do_id($2); }
        ;

action: ACTION IGNORE
        | ACTION EXECUTE QSTRING
        ;

%%

void yyerror(const char *s)
{
    printf("error: %s", s);
}



