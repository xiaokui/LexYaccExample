#include <QtCore>
#include <stdio.h>
#include <qfile.h>
#include <QByteArray>
#include <QTextCodec>

#include "lexer.h"

extern FILE *yyin;
extern int code, comments, whiteSpace;

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);


    yyin = fopen("00.txt", "r");

    yylex();

    fclose(yyin);

    printf("code: %d, comments: %d, whitespace %d"
           , code, comments, whiteSpace);

    return app.exec();
}



