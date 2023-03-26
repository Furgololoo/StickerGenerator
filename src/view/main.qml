import QtQuick
import QtQuick.Window

Window {
    // flags: Qt.FramelessWindowHint | Qt.Window
    visibility: Qt.WindowFullScreen
    visible: true
    title: qsTr("Sticker Generator")

    Rectangle{
        id: rect
        anchors.fill: parent
        color: "#E1E1E5"


        Menu {
            id: menu
            width: 200
            anchors.left: rect.left
            anchors.leftMargin: 8
            anchors.top: rect.top
            anchors.topMargin: 8
            anchors.bottom: rect.bottom
            anchors.bottomMargin: 8
        }

        ImagePanel {
            id: imagePanel
            anchors.left: menu.right
            anchors.leftMargin: 16
//            anchors.right: rect.right
//            anchors.rightMargin: 8
            anchors.top: rect.top
            anchors.topMargin: 8
//            anchors.bottom: rect.bottom
//            anchors.bottomMargin: 8
            width: 1200
            height: 900

            Component.onCompleted: PageManager.createNewPage(imagePanel.width, imagePanel.height)
        }
    }

}
