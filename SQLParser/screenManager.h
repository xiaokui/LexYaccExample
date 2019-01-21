#ifndef SCREENMANAGER_H
#define SCREENMANAGER_H

#include "qstring.h"
#include <QList>

struct stScreenItem
{
    int id;
    QString screenName;
    QString titleName;
    QList<QString> itemName;
};


void start_screen(char *s);
void add_title(char *s);
void add_line(char *s);

class screenManager
{
public:
    ~screenManager();

    static screenManager *instance();

    struct stScreenItem *screen();

    int add();

    QList<struct stScreenItem *> *allObjects();

protected:
    screenManager();
    static screenManager *m_pInstance;

    struct stScreenItem *m_pScreen;

    QList<struct stScreenItem *> m_lstScreen;

};


#endif // SCREENMANAGER_H
