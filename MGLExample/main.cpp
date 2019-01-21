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

#include <iostream>


extern FILE *yyin;

void do_id(const char *s)
{
    return;

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

    yyparse();

    fclose(yyin);

    for (int i = 0; i < screenManager::instance()->allObjects()->size(); ++i)
    {
        struct stScreenItem *pItem = screenManager::instance()->allObjects()->at(i);

        printf("%s\n", pItem->screenName.toUtf8().data());
        printf("%s\n", pItem->titleName.toUtf8().data());

        for (int j =0; j < pItem->itemName.size(); ++j)
        {
            printf("%d) %s\n", j+1, pItem->itemName.at(j).toUtf8().data());
        }
        printf("\n\n");

    }

    return 0;
}

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    char buffer[] = "title \"one\"\n ";

    //doparse(buffer);

    dotest();

    for (;;)
    {
        char a;
        std::cin >> a;
        std::cout << a;
        switch (a) {
        case 'q':
            return 0;
            break;
        default:
            break;
        }
    }


    return app.exec();
}



