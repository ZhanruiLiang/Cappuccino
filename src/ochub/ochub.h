// =====================================================================================
// 
//       Filename:  hub.h
// 
//    Description:  A Class that can process and send data to the workspace swf
// 
//        Version:  1.0
//        Created:  07/21/2011 02:32:00 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  ddmbr (), iddmbr@gmail.com
//        Company:  
// 
// =====================================================================================

//NOTE:Under these situation the class with be used
//Toolbar
//---(hub have to send a signal)
//Workspace Add a new object
//---(hub will recieve an XML string with tag OBJ)
//Workspace addjust an object
//---(hub will recieve an XML string with tag MODIFY.Parse it into XML Dom tree and send it to DB)
//panels adjust an object
//---(hub will recieve som parameter, then get the current page and pagetype, send the adjust XML to DB)
//panels create an object(footage instance)
//---(hub will directly access to the footage DB and get the XML message)

#include <QtXml>
#include <QtWebKit>
#include <QString>

class OcHub
{
public:
	OcHub(QWebView*);
	void ModeCHG(QString Action, QString Draw);
	void ModeCHG(QString Action);

	void AddFootage(QString name);//name of the footage
	void AddShape(QString XMLstring);//Include selecting

	void Modify(QString Target, QString Att, QString value);
	void Modify(QString XMLstring);

private:
	void SendtoJS(QDomDocument*);
	QString replace(QString);
	QDomDocument toXML(QString);
	QString toQString(QDomDocument*);
	QWebView *view;
	QWebFrame *frame;
	void addAtt(QString Att, QString value, QDomElement* Target);
};
