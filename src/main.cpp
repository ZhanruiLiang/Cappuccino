//#include library
#include<QApplication>
//#include classes
#include "MainUI/mainui.h"

int main(int argc, char *argv[])
{
//	QApplication::setStyle(new QMacStyle());
	QApplication app(argc,argv);
	QTextCodec::setCodecForTr(QTextCodec::codecForName("utf8"));
	QTextCodec::setCodecForLocale(QTextCodec::codecForName("utf8"));
	QTextCodec::setCodecForCStrings(QTextCodec::codecForName("utf8"));
	app.setStyleSheet("QMenu{ background-image: url(:/MainUI/images/background/panel.png); }");
	mainUI *mainWindow = new mainUI;
	mainWindow -> resize(1366,768);
	mainWindow -> show();
	return app.exec();
}

