%{

unsigned charCount = 0;
unsigned wordCount = 0;
unsigned lineCount = 0;

%}

word [^ \t\n]+
eol \n

%%

{word} {wordCount++; charCount += yyleng; }
{eol} {charCount++; lineCount++; }

. charCount++;

%%


int yywrap(void) {
     return 1;
     }


