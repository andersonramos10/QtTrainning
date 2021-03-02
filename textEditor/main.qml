import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.1
//import org.qtproject.example 1.0

ApplicationWindow
{
    visible: true
    width: 640
    height:  480
    minimumWidth: 400
    minimumHeight: 300

    title: "Temporary Name"

    Action
    {
        id: cutAction
        text: "cut"
        shortcut: "ctlr+x"
        iconSource: "images/editcut.pgn"
        iconName: "edit-cut"
        onTriggered: TextArea.cut()
    }

}
