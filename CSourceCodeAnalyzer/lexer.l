%{
int comments, code, whiteSpace;

%}

%s COMMENT

%%

^[ \t]*"/*" { BEGIN COMMENT; }
^[ \t]*"/*".*"*/"[ \t]*\n { comments++;}

<COMMENT>"*/"[ \t]*\n { BEGIN 0; comments++; }
<COMMENT>"*/" {BEGIN 0;}
<COMMENT>\n { comments++; }
<COMMENT>.\n { comments++; }

^[ \t]*\n  {whiteSpace++;}

.+"/*".*"*/".*\n {code++;}
.*"/*".*"*/".+\n {code++;}
.+"/*".*\n {code++; BEGIN COMMENT;}
.\n {code++;}

. ;

%%


int yywrap(void) {
     return 1;
     }


