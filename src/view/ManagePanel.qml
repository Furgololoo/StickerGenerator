import QtQuick
import "CustomComponents"

Item {

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
                mainText: "Save"

                onPressed: StickerManager.addText()
            }

            Item{
                width: parent.width
                height: 50
            }

            CustomTextField {
                id: name
                width: parent.width
                height: 30
                mainText: ""
                label: "Name"
            }

            Item {
                width: parent.width
                height: 30

                CustomTextField {
                    id: xTF
                    width: parent.width / 2
                    height: 30
                    anchors.left: parent.left
                    mainText: ""
                    label: "X"
                }

                CustomTextField {
                    id: yTF
                    width: parent.width / 2
                    height: 30
                    anchors.right: parent.right
                    mainText: ""
                    label: "Y"
                }
            }

            Item {
                width: parent.width
                height: 30

                CustomTextField {
                    id: wifthTF
                    width: parent.width / 2
                    height: 30
                    anchors.left: parent.left
                    mainText: ""
                    label: "W"
                }

                CustomTextField {
                    id: heightTF
                    width: parent.width / 2
                    height: 30
                    anchors.right: parent.right
                    mainText: ""
                    label: "H"
                }
            }

        }
    }
}
