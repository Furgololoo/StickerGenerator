import QtQuick

Item {

    Item {
        id: main
        height: parent.height * 0.7
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        ManagePanel {
            anchors.fill: parent
        }

    }

    Item {
        id: footer
        anchors.top: main.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        AddStickerPanel {
            anchors.fill: parent
        }
    }


}



