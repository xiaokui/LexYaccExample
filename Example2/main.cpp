#include <QtCore>
#include <stdio.h>
#include <qfile.h>
#include <QByteArray>
#include <QTextCodec>

#include "lexer.h"

#if _MSC_VER >= 1600
#pragma execution_character_set("utf-8")
#endif

extern FILE *yyin;

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

   // system("chcp 65001");
   // QTextCodec::setCodecForCStrings(QTextCodec::codecForName("utf8"));

    yyin = fopen("00.txt", "r");

    yylex();

    fclose(yyin);

    return app.exec();
}



