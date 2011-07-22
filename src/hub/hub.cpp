// =====================================================================================
// 
//       Filename:  hub.cpp
// 
//    Description: The implementation of sender 
// 
//        Version:  1.0
//        Created:  07/21/2011 02:35:46 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  ddmbr, iddmbr@gmail.com
//        Website:  http:\\ddmbr.tk
//         School:  Sun-Yat-Sen University
// 
// =====================================================================================
#include "hub.h"
#include<QtCore>
#include<QObject>
Hub::Hub(QWebView *view)
{
	this->view = view;
	this->frame = view->page()->mainFrame();
}
void Hub::fromToolbar(QString Action, QString Shape)
{
	qDebug()<<"Success";
	QDomDocument doc;
	QDomElement root = doc.createElement("MODE");
	doc.appendChild(root);
	root.setAttribute("Action", Action);
	if(Action == "Draw")
	{
		//More Attribute should be set
		//Access to the DB and get Current settings
		//The following is just for test and should be modified
		root.setAttribute("Shape", Shape);
		root.setAttribute("LineColor", "#000000");//?
		root.setAttribute("FillColor", "#000000");
		root.setAttribute("Thickness", 2);
		root.setAttribute("Arrow", "false");
	}

	//process the XML and send to JS
	SendtoJS(&doc);
}
void Hub::fromPanelAdd(QString name)
{}
void Hub::fromPanelMod(QString Target, QString Att, QString value)
{}
void Hub::fromWkspcAdd(QString XMLstring)
{}
void Hub::fromWkspcMod(QString XMLstring)
{}
void Hub::SendtoJS(QDomDocument* doc)
{
	QString XMLstring = toQString(doc);
//	frame->evaluateJavaScript(QString("msg_Cpp2AS(%1)").arg(QString("\'")+escape(XMLstring)+"\'"));
	qDebug()<<"QD1:"<<XMLstring;
	//QString str = "\'fu\" \"ck\'";
//	XMLstring = "<MODE C= \"sda\" F=\"#232323\" B=\"cc\" />";
	qDebug()<<"QD:"<<replace(XMLstring);
	frame->evaluateJavaScript(QString("msg_Cpp2AS(%1)").arg(replace(XMLstring)));
	//frame->evaluateJavaScript(QString("msg_Cpp2AS(%1)").arg(str));
}
QDomDocument Hub::toXML(QString XMLstring)
{
	QDomDocument doc;
	doc.setContent(XMLstring);
	return doc;
}
QString Hub::toQString(QDomDocument *doc)
{
	QString XMLstring;
	QTextStream text(&XMLstring);
	doc->save(text, 4);
	return XMLstring;
}
QString Hub::replace(QString source)
{
	QString s = source;
	s.replace(QString("\""), QString("\\\""));
	s.replace(QString("\n"), QString(""));
	s = '"' + s + '"';
	return s;
}

