%{

#include <stdio.h>
#include <math.h>
#include "parser.h"

int lineno;

void warning(char *s, char *t)
{
    printf("%s: %s", "", s);

    printf("line: %d\n", lineno);
}

void log(char *s)
{
    return;

    printf("line: %d {%s}\n", lineno, s);
}


%}
ws          [ \t]+
comment     #.*
qstring     \"[^\"\n]*[\"\n]
id          [a-zA-Z][a-zA-Z0-9]*
nl          \n

%%
{ws} { log("{ws}");}
{qstring} { log("{qstring}");
            yylval.string = strdup(yytext+1);
            //printf("%s\n", yylval.string);

            int yylen = strlen(yytext);
            if (yylval.string[yylen-2] != '"')
                warning("Unterminated character string", (char *)0);
            else
                yylval.string[yylen-2] = ' ';

            log(yylval.string);

            return QSTRING;
          }
screen {log("screen"); return SCREEN; }
title { log("title");return TITLE;}
item {log("item");return ITEM;}
command {log("command");return COMMAND;}
action {log("action");return ACTION;}
execute {log("execute");return EXECUTE;}
ignore {log("ignore");return IGNORE;}
end {return END;}
{id} {  log("id");
        yylval.string = strdup(yytext);
        return ID;
     }
{nl} {lineno++;}
. { return yytext[0];}

%%


int yywrap(void) {
     return 1;
     }



