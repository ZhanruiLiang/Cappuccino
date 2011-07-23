/****************************************************************************
** Meta object code from reading C++ file 'mainui.h'
**
** Created: Sat Jul 23 16:47:05 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "src/MainUI/mainui.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainui.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_mainUI[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
       8,    7,    7,    7, 0x08,
      16,    7,    7,    7, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_mainUI[] = {
    "mainUI\0\0about()\0myclicked()\0"
};

const QMetaObject mainUI::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_mainUI,
      qt_meta_data_mainUI, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &mainUI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *mainUI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *mainUI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_mainUI))
        return static_cast<void*>(const_cast< mainUI*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int mainUI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: about(); break;
        case 1: myclicked(); break;
        default: ;
        }
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
