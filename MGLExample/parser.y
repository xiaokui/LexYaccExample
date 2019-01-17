
%{

#include <stdio.h>
#include <string.h>
#include "screenManager.h"


extern int yylex(void);
void yyerror(const char *s);

void do_id(const char *s);


extern void start_screen(char *s);


%}

%union {
    char *string;
};

%token COMMAND ACTION IGNORE EXECUTE ITEM TITLE SCREEN END
%token <string> QSTRING ID
%%

start: screens
       ;

screens: /*empty*/
        | screens screen
        ;

screen: screen_name screen_contents screen_terminator
        | screen_name screen_terminator
        ;

screen_name: SCREEN ID { start_screen($2);}
        | SCREEN    { start_screen(strdup("default"));}
        ;

screen_terminator: END ID
        | END
        ;

screen_contents: titles lines
        ;

titles:
        | titles title
        ;

title:  TITLE QSTRING
        ;

lines: line
        | lines line
        ;

line: ITEM QSTRING command action
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





