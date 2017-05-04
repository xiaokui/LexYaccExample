%{



%}
%%

[\n\t ] ;

-?(([0-9]+)|([0-9]+)\.[0-9]+) { printf("%s: is number \n", yytext); }

#.* { printf("%s: is comment \n", yytext);}

\*[^*\n]*[*\n] { printf("%s: is quoted string \n", yytext);}

. ;

%%


int yywrap(void) {
     return 1;
     }


