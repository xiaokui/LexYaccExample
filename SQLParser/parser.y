
%{

#include <stdio.h>
#include <string.h>
#include "screenManager.h"


extern int yylex(void);
void yyerror(const char *s);

void do_id(const char *s);


extern void start_screen(char *s);
extern void add_title(char *s);
extern void add_line(char *s);

char *act_str = NULL;

%}

%union {
    char *string;
    int val;
};

%token COMMAND ACTION IGNORE EXECUTE ITEM TITLE SCREEN END
%token <string> QSTRING ID
%type <val> action
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

title:  TITLE QSTRING { add_title($2); }
        ;

lines: line
        | lines line
        ;

line: ITEM QSTRING command action
        {
            //item_str = $2;
            add_line($2);

            //$$ = ITEM;
        }
        ;

command: COMMAND
        | COMMAND ID { do_id($2); }
        ;

action: ACTION IGNORE { }
        | ACTION EXECUTE QSTRING
{
    act_str = $3;
    $$ = EXECUTE;
}
        ;

%%

void yyerror(const char *s)
{
    printf("error: %s", s);
}





