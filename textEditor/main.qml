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

    MessageDialog //Define a dialog to be shown inside the "Help" menu. No need to define an action for the Help menu, since it does nothing
    {
        id: aboutBox
        title: "about Text"
        text: "This is an example for trainnning purposes"
        icon: StandardIcon.Information
    }

    /****************************************************************************
    ** Menu with the usual parameters like File, Edit, etc.
    */
    menuBar: MenuBar //Upper menu with options to show submenus(MenuItem)
    {
        Menu
        {
            title: "&File"
            MenuItem {text: "Quit"; onTriggered: Qt.quit()}
        }

        Menu
        {
            title: "&Edit"
            MenuItem { action: cutAction}

        }

        Menu
        {
            title: "&Format"
        }

        Menu
        {
            title: "&Help"
            MenuItem {text: "About ..."; onTriggered: aboutBox.open()}
        }
    }

}
