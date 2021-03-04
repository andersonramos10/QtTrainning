import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.1

ApplicationWindow
{
    width: 500
    height: 500
    visible: true
    id: root

    Row
    {
        id: tools

        Button
        {
            id: clear
            text: "Clear"
            onClicked:
            {
                mouse.clear
                canvas.clear()
            }
        }

        Button
        {
            id: save
            text: "Save"
            onClicked:
            {

            }
        }
    }

    MessageDialog //Define a dialog to be shown inside the "Help" menu. No need to define an action for the Help menu, since it does nothing
    {
        id: aboutBox
        title: "about Text"
        text: "This is an example for trainnning purposes"
        icon: StandardIcon.Information
    }

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

    //*****Canvas: Area to let you Draw
    Canvas
    {
        id: canvas
        anchors.top: tools.bottom
        width: 500
        height: 500
        property int lastX: 0 //tracks the position of the mouse cursor
        property int lastY: 0

        function clear()
        {
            var conxt = getContext("2d")
            conxt.reset()
            canvas.requestPaint()
            mouse.clear()
        }

        onPaint:
        {
            var contx = getContext("2d") //get the 2d canvas
            contx.lineWidth = 2
            contx.strokeStyle = color.red

            contx.beginPath()
            contx.moveTo(lastX, lastY) //move to the last knwon position. Without it, it will only produce a straight line
            lastX = area.mouseX
            lastY = area.mouseY
            contx.lineTo(lastX, lastY)
            contx.stroke()

            mouse.test() //get from the pointer "mouse" created in .h. Call the function test defined in .cpp

        }
    }

    //track mouse movement
    MouseArea
    {
        id: area
        anchors.fill: parent

        onPressed:
        {
            canvas.lastX = mouseX
            canvas.lastY = mouseY
        }

        onPositionChanged:
        {
            canvas.requestPaint() //request a paint action form onPaint on canvas
        }
    }

}
