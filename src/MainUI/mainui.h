#ifndef MAINUI_H
#define MAINUI_H

//#include library
#include <QMainWindow>
#include <QWorkspace> 
#include <QtWebKit>
#include <QStyle>
#include <QtXml>
class QPushButton;
class QLineEdit;
class QLabel;
class QAction;
class QMenu;
//#include classes
#include "../hub/hub.h"

class mainUI:public QMainWindow
{
	Q_OBJECT
public:
	mainUI();
protected:
	void closeEvent(QCloseEvent *closeevent);
private slots:
	//file menu
	//void newFile();
	//edit menu

	//visual menu

	//tool menu

	//help menu
	void about();
	//cmdBoxLayout
//	void enableCmdEnter(const QString &);

	//Hub
	void myclicked();
//signals:
	

private:
	//-------Hub----------
	Hub *hub;
	//-------Menu---------
	QMenuBar *menubar;

	QMenu *fileMenu;
	QMenu *editMenu;
	QMenu *optionMenu;
	QMenu *toolMenu;
	QMenu *playMenu;
	QMenu *helpMenu;
	//--------TabPanel-----
	QTabWidget *tabWidget;
	
	//--------WorkSpace------
	QWorkspace *workspace;

	QWebView *view;
	//-----ToolBar-----------
	QToolBar *rightToolBar;

	QPushButton *Draw_Line_Button;
	//----FileMenu Action-----
	QAction *openAction;
	QAction *newAction;
	QAction *saveAction;
	QAction *closeAction;
	QAction *saveAsAction;
	QAction *exitAction;
	//----EditMenu Action-----
	QAction *copyAction;
	QAction *pasteAction;
	QAction *cutAction;
	QAction *undoAction;
	QAction *redoAction;
	//----ToolMenu-----
	QAction *toollibAction;
	QAction *configAction;
	//----playMenu-----	
	QAction *playfirstAction;
	QAction *playhereAction;
	QAction *outfileAction;
	//----helpMenu-----
	QAction *helpAction;
	QAction *aboutAction;
	
	//-----StatusBar-------
	QStatusBar *status;
	QLabel *statusMsg;

	//-----SearchBox-----
	QLineEdit *cmdLine;

	
	void createAction();
	void createMenu();
	void createToolBar();
};
#endif
