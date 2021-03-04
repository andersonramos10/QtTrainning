#include "mousememory.h"

MouseMemory::MouseMemory(QObject *parent) : QObject(parent)
{

}

void MouseMemory::test()
{
    qDebug() <<"Hello from c++";
}

void MouseMemory::clear()
{
  qDebug()<<"Erasing data";
}

void MouseMemory::save()
{

}

void MouseMemory::add(double x, double y)
{

}

void MouseMemory::add(QPointF point)
{

}
