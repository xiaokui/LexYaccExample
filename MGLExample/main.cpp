#include <QtCore>
#include <stdio.h>
#include <qfile.h>
#include <QByteArray>
#include <QTextCodec>
#include <QTemporaryFile>
#include <QDebug>

#include "lexer.h"
#include "parser.h"
#include "screenManager.h"

extern FILE *yyin;

void do_id(const char *s)
{
    printf("--%s\n", s);
}

int doparse(char *s)
{
    QTemporaryFile file;
    if (!file.open()) {
        return -1;
    }

    QFile f(file.fileName());
    f.open(QIODevice::WriteOnly);
    f.write(QByteArray(s));
    f.close();

    yyin = fopen(file.fileName().toLocal8Bit(), "r");

    yyparse();

    fclose(yyin);

    return 0;
}

int dotest()
{
    yyin = fopen("00.txt", "r");


    screenManager m;

    yyparse();

    fclose(yyin);

    return 0;
}

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    char buffer[] = "title \"one\"\n ";

    //doparse(buffer);

    dotest();

    return app.exec();
}



