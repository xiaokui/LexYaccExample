#include <QtCore>
#include <stdio.h>
#include <qfile.h>
#include <QByteArray>
#include <QTextCodec>

#include "lexer.h"

extern FILE *yyin;
extern unsigned charCount;
extern unsigned wordCount;
extern unsigned lineCount;

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    yyin = fopen("00.txt", "r");

    yylex();

    printf("%d,%d,%d", charCount, wordCount,lineCount);

    fclose(yyin);

    return app.exec();
}



