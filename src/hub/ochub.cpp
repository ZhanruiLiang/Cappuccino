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
#include "ochub.h"
#include<QtCore>
#include<QObject>
OcHub::OcHub(QWebView *view)
{
	this->view = view;
	this->frame = view->page()->mainFrame();
}
void OcHub::ModeCHG(QString Action, QString Shape)
{
	QDomDocument doc;
	QDomElement root = doc.createElement("MODE");
	doc.appendChild(root);
	//root.setAttribute("Action", Action);
	addAtt(QString("Action"), Action, &root);
	if(Action == "Draw")
	{
		//More Attribute should be set
		//Access to the DB and get Current settings
		//The following is just for test and should be modified
		addAtt(QString("Shape"), Shape, &root);
		addAtt(QString("LineColor"), "#000000", &root);//?
		addAtt(QString("FillColor"), "#000000", &root);
		addAtt(QString("Thickness"), "2", &root);
		addAtt(QString("Arrow"), "false", &root);
	}

	//process the XML and send to JS
	SendtoJS(&doc);
}
void OcHub::ModeCHG(QString Action)
{
	QDomDocument doc;
	QDomElement root = doc.createElement("MODE");
	addAtt(QString("Action"), Action, &root);
	doc.appendChild(root);
}
void OcHub::AddFootage(QString name)
{}
void OcHub::Modify(QString Target, QString Att, QString value)
{
	//deal with DB
	//deal with Wkspc
}
void OcHub::Modify(QString XMLstring)
{
	//deal with DB
	//deal with panel?
}
void OcHub::AddShape(QString XMLstring)
{
	//deal with DB
	//deal with panel?
}
void OcHub::SendtoJS(QDomDocument* doc)
{
	QString XMLstring = toQString(doc);
	XMLstring = replace(XMLstring);
	qDebug()<<XMLstring;
	frame->evaluateJavaScript(QString("msg_Cpp2AS(%1)").arg(XMLstring));
}
QDomDocument OcHub::toXML(QString XMLstring)
{
	QDomDocument doc;
	doc.setContent(XMLstring);
	return doc;
}
QString OcHub::toQString(QDomDocument *doc)
{
	QString XMLstring;
	QTextStream text(&XMLstring);
	doc->save(text, 4);
	return XMLstring;
}
QString OcHub::replace(QString source)
{
	QString s = source;

	//s.replace(QString("\""), QString("\\\""));
	//s.replace(QString("\n"), QString(""));
	//s = '"' + s + '"';

	s.remove(-1, 1);
	return s;
}
void OcHub::addAtt(QString Att, QString value, QDomElement* Target)
{
	QDomDocument *doc = &(Target->ownerDocument());
	QDomElement AttNode = doc->createElement(Att);
	QDomText val = doc->createTextNode(value);
	AttNode.appendChild(val);
	Target->appendChild(AttNode);
}
