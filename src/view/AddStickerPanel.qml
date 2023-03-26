import QtQuick
import "CustomComponents"

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#FFFFFF"

        Column {
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            height: parent.height
            spacing: 8

            CustomButton {
                width: parent.width
                height: 40
                mainText: "Add Rectangle"
                onPressed: {
                    PageManager.addRectangle()
                }
            }

            CustomButton {
                width: parent.width
                height: 40
                mainText: "Add Ellipse"
                onPressed: {
                    PageManager.addEllipse()
                }
            }

            CustomButton {
                width: parent.width
                height: 40
                mainText: "Add Text"
                onPressed: {
                    PageManager.addText()
                }
            }
        }
    }
}
