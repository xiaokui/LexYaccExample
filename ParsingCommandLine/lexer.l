%{

unsigned verbose;
char *progName;


%}
%%

-h   |
"-?" |
-help { printf("usage is %s [-hlep | -h | -? ] [-verbose | -v ] "
            "[(-file | -f ) fileName]\n", progName); }

-v |
-verbos {printf("verbos mode is on \n"); verbose=1;}

%%


int yywrap(void) {
     return 1;
     }


