#include <QtCore>
#include <stdio.h>
#include <qfile.h>
#include <QByteArray>
#include <QTextCodec>

#include "lexer.h"
#include "parser.h"
//#include "SymbolTable.h"

extern FILE *yyin;

void do_id(const char *s)
{
    printf("--%s\n", s);
}

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    yyin = fopen("00.txt", "r");

    yyparse();

    fclose(yyin);

    return app.exec();
}



