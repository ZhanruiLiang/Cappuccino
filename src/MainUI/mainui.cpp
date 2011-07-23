//#include library
#include <QtGui>
//#include classes
#include "mainui.h"

//Construtor

mainUI::mainUI()
{
	//-----for Static 
	QResource::registerResource("/path/to/resources.rcc");     //Build Path for Resources
	
	//-----Create StatusBar
	status = new QStatusBar(this);
	statusMsg = new QLabel(status);
	statusMsg -> setAlignment(Qt::AlignHCenter);
	statusMsg -> setText(tr("GO saD"));
	status -> setSizeGripEnabled(true);
	status -> setStyleSheet(tr("background-image: url(:/images/background/menubar.png)"));
	setStatusBar(status);			//Make |status| as the StatusBar of the MainWindow
	
	//-----Create main MenuBar and Creat Actions	
	menubar = new QMenuBar(this);
	menubar -> setGeometry(0,0,1300,25);	
	menubar -> setStyleSheet(tr("color: white; background-image: url(:/images/background/menubar.png)"));

	createAction();
	createMenu();
	setMenuBar(menubar);                  //Make |menubar| as the MenuBar of the MainWindow
	
	//-----Build TabPanel
	tabWidget = new QTabWidget(this);
	tabWidget -> setTabPosition(QTabWidget::East);         //Make the Label on the right of the Panel
	tabWidget -> setTabShape(QTabWidget::Rounded);

	tabWidget -> setGeometry(0,25,300,700);
	tabWidget -> setStyleSheet(tr("background-image: url(:/images/background/panel.png)"));
	
	//-----Cope with Workspace
	workspace = new QWorkspace(this);
	workspace -> setScrollBarsEnabled(true);
	workspace -> setGeometry(300,25,1000,625);    
	QWebSettings::globalSettings()->setAttribute(QWebSettings::PluginsEnabled, true);
	
	view = new QWebView(workspace);
	view -> load(QUrl("wkspace/swfcontainer.html"));
	
	hub = new Hub(view);  			//New a Hub instance to emit info to DB and AS

	//-----SearchBox
	cmdLine = new QLineEdit(this);
	cmdLine -> setPlaceholderText(tr("Please Input Command Lines"));
	cmdLine -> setGeometry(300,665,200,25);

//	connect(cmdLine, SIGNAL(textChanged(const QString&)), this, SLOT(enableCmdEnter(const QString &)));
	
	//-----ToolBar on the Right Side
	rightToolBar = new QToolBar(this);
	rightToolBar -> setOrientation(Qt::Vertical);     
	rightToolBar -> setGeometry(1300,0,66,1000);
	rightToolBar -> setStyleSheet(tr("background-image: url(:/images/background/toolbar_new.png)"));
	rightToolBar -> setMovable(false);           //Users cannot drag the Toolbar
	//Build Toolbar Button 
	Draw_Line_Button = new QPushButton(rightToolBar);
	Draw_Line_Button -> setStyleSheet(QString::fromUtf8("background-image: url(:/images/icons/Draw_ArrowLine.png); background-color: rgba(0, 0, 0, 0)"));
	Draw_Line_Button -> setGeometry(10, 10, 50, 50);
	
	connect(Draw_Line_Button, SIGNAL(clicked()), this, SLOT(myclicked()));

	setWindowTitle(tr("IdeaPresentation v0.0.1 just main UI structure"));
}

void mainUI::myclicked()
{
	QString name = sender() -> objectName();
	QStringList list = name.split("_");
	hub -> ModeCHG("Draw", "Line");	
}

/*//if cmdLine isn't empty then enable cmdEnter Button
void mainUI::enableCmdEnter(const QString &textline)

	cmdEnter -> setEnabled( !textline.isEmpty() );
}*/

//Create tha actions. Here I wonder if we had better separate it into saveral functions divided by corresponding menu.
void mainUI::createAction()
{
	QString blank = tr("                                                       ");
	blank = blank + blank + blank + blank + blank;
	//File Action
	//newAction
	newAction = new QAction(tr("新建(&N)"),this);
	newAction -> setShortcut(QKeySequence::New);
	newAction -> setStatusTip(blank + tr("创建一个新文档"));
	connect(newAction, SIGNAL(triggered()), this, SLOT(newFile()));
	//openAction
	openAction = new QAction(tr("打开(&O)"),this);
	openAction -> setShortcut(QKeySequence::Open);
	openAction -> setStatusTip(blank + tr("打开一个已有的文件"));
	//saveAction
	saveAction = new QAction(tr("保存(&S)"),this);
	saveAction -> setShortcut(QKeySequence::Save);
	saveAction -> setStatusTip(blank + tr("将当前文档保存"));
	//save_asAction
	saveAsAction = new QAction(tr("另存为(&A)"),this);
	saveAsAction -> setShortcut(tr("Ctrl+A"));
	saveAsAction -> setStatusTip(blank + tr("将当前文档另存为"));
	//closeAction
	closeAction = new QAction(tr("关闭(&C)"),this);
	closeAction -> setShortcut(tr("Ctrl+W"));
	closeAction -> setStatusTip(blank + tr("关闭当前页面文档"));
//	connect(exitAction, SIGNAL(triggered()), this, SLOT(close()));
	//exitAction
	exitAction = new QAction(tr("退出(&X)"),this);
	exitAction -> setShortcut(tr("Ctrl+Q"));
	exitAction -> setStatusTip(blank + tr("退出本程序"));
	connect(exitAction, SIGNAL(triggered()), this, SLOT(close()));

	//Edit Action
	//copyAction
	copyAction = new QAction(tr("复制(&C)"),this);
	copyAction -> setShortcut(QKeySequence::Copy);
	copyAction -> setStatusTip(blank + tr("复制～～"));
	//pasteAction
	pasteAction = new QAction(tr("粘贴(&P)"),this);
	pasteAction -> setShortcut(QKeySequence::Paste);
	pasteAction -> setStatusTip(blank + tr("粘贴～～"));
	//cutAction
	cutAction = new QAction(tr("剪切(&X)"),this);
	cutAction -> setShortcut(QKeySequence::Cut);
	cutAction -> setStatusTip(blank + tr("剪切～～"));
	//undoAction
	undoAction = new QAction(tr("撤销(&Z)"),this);
	undoAction -> setShortcut(QKeySequence::Undo);
	undoAction -> setStatusTip(blank + tr("返回上一步操作"));
	//redoAction
	redoAction = new QAction(tr("恢复(&Y)"),this);
	redoAction -> setShortcut(QKeySequence::Redo);
	redoAction -> setStatusTip(blank + tr("恢复后一步撤销的操作"));
	
	//Tool Action
	//Tool Library Action
	toollibAction = new QAction(tr("工具仓库"),this);
	toollibAction -> setStatusTip(blank + tr("华丽丰富的工具按钮仓库，打开就知道了～～"));
	//Preference/Config Action
	configAction = new QAction(tr("配置"),this);
	configAction -> setStatusTip(blank + tr("配置系统选项"));
	
	//Play Action
	
	//Help Action
	//helpAction
	helpAction = new QAction(tr("帮助手册"),this);
	helpAction -> setStatusTip(blank + tr("有不懂？来看看手册吧～～"));
	//aboutAction
	aboutAction = new QAction(tr("关于"),this);
	aboutAction -> setStatusTip(blank + tr("关于本软件"));
	connect(aboutAction, SIGNAL(triggered()), this, SLOT(about()));
}

//Create MenuBar
void mainUI::createMenu()
{
	//fileMenu
	fileMenu = new QMenu(menubar);
	fileMenu -> setTitle(tr("文件(&F)"));
	fileMenu -> setTearOffEnabled(true);	
	fileMenu -> addAction(newAction);
	fileMenu -> addAction(openAction);
	fileMenu -> addAction(saveAction);
	fileMenu -> addAction(saveAsAction);
	fileMenu -> addSeparator();
	
	fileMenu -> addSeparator();
	fileMenu -> addAction(exitAction);
//	fileMenu -> setStyleSheet(tr("color: white; background-image: url(:/images/background/panel.png)"));
	menubar -> addAction(fileMenu -> menuAction());
	//editMenu
	editMenu = new QMenu(menubar);
	editMenu -> setTitle(tr("编辑(&E)"));
	editMenu -> addAction(copyAction);
	editMenu -> addAction(pasteAction);
	editMenu -> addAction(cutAction);
	editMenu -> addAction(undoAction);
	editMenu -> addAction(redoAction);
	menubar -> addAction(editMenu -> menuAction());
	//toolMenu
	toolMenu = new QMenu(toolMenu);
	toolMenu -> setTitle(tr("工具(&T)"));
	toolMenu -> addAction(toollibAction);
	toolMenu -> addAction(configAction);
	menubar -> addAction(toolMenu -> menuAction());
	//playMenu
	playMenu = new QMenu(menubar);
	playMenu -> setTitle(tr("播放(&P)"));
	menubar -> addAction(playMenu -> menuAction());
	//helpMenu
	helpMenu = new QMenu;
	helpMenu -> setTitle(tr("帮助(&H)"));
	helpMenu -> addAction(helpAction);
	helpMenu -> addAction(aboutAction);
	helpMenu -> setPalette(*(new QPalette(Qt::red)));
	menubar -> addMenu(helpMenu);
	menubar-> addSeparator();
}	


//Action functions
//newFile

//about
void mainUI::about()
{
	QMessageBox::about(this, tr("About IdeaPresentation"), tr("<h2>IdeaPresentation v0.0.1<h2>" "<p>This is about infomation, detailed message missing."));
}

//closeEvent
void mainUI::closeEvent(QCloseEvent *event)
{
	int result = QMessageBox::warning(this, tr("Quit IdeaPresentaion?"),tr("Do you really want to quit the application?"),QMessageBox::Yes | QMessageBox::No );

	if ( result == QMessageBox::Yes )
		event -> accept();
	else 	event -> ignore();
}
