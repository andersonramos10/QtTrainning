#ifndef MOUSEMEMORY_H
#define MOUSEMEMORY_H

#include <QObject>

class MouseMemory : public QObject
{
    Q_OBJECT
public:
    explicit MouseMemory(QObject *parent = nullptr);

signals:

};

#endif // MOUSEMEMORY_H
