#include "screenManager.h"
#include "stdio.h"


screenManager *screenManager::m_pInstance = NULL;


screenManager::screenManager()
{
    m_pScreen = NULL;
}

screenManager::~screenManager()
{

}

stScreenItem *screenManager::screen()
{
    return m_pScreen;
}

int screenManager::add()
{
    m_pScreen = new struct stScreenItem;
    m_lstScreen.append(m_pScreen);

    return m_lstScreen.size();
}

QList<stScreenItem *> *screenManager::allObjects()
{
    return &m_lstScreen;
}


screenManager *screenManager::instance()
{
    if (m_pInstance == NULL)
    {
        static screenManager it;
        m_pInstance = &it;
    }

    return m_pInstance;
}


void start_screen(char *s)
{
    //printf("screen name: %s\n", s);

    screenManager::instance()->add();
    screenManager::instance()->screen()->screenName = s;

}

void add_title(char *s)
{
    screenManager::instance()->screen()->titleName = s;
}

void add_line(char *s)
{
    screenManager::instance()->screen()->itemName.append(s);
}

