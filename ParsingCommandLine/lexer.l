%{

unsigned verbose;
char *progName;


%}

%s FNAME

%%
[ ]+               { ;}



-h   |
"-?" |
-help { printf("usage is %s [-hlep | -h | -? ] [-verbose | -v ] "
            "[(-file | -f ) fileName]\n", progName); }

-v |
-verbos {printf("verbos mode is on \n"); verbose=1;}

-f |
-file { BEGIN FNAME; }


<FNAME>[^ ]+ {printf("use file is %s\n", yytext); BEGIN 0;}
%%


int yywrap(void) {
     return 1;
     }


