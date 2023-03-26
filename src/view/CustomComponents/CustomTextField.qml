import QtQuick
import QtQuick.Controls

Item {
    id: root
    property string label: ""
    property string mainText: ""
    property string placeholder: ""
    property color borderColor: "#E1E1E5"
    property int borderWidth: 2
    property bool border: false

    CustomLabel {
     id: lbl
     anchors.left: parent.left
     anchors.leftMargin: 5
     height: parent.height
     width: lbl.getPaintedWidth()
     mainText: label
     textColor: "#A1A1A5"
    }

    Rectangle {
        id: inputFieldRect
        height: parent.height
        width: parent.width - lbl.width
        anchors.left: lbl.right
        color: "red"
        border.color: (border === true) ? borderColor : ""
        border.width: (border === true) ? borderWidth : 0

        TextInput {
            id: inputField
            font.pointSize: 12
            anchors.top: parent.top
            anchors.right: parent.right
            height: parent.height - 3
            width: parent.width - 10
            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter
            text: mainText
            onTextChanged: validateText(text)
        }

        TextMetrics {
            id: textMetrics
            font.family: inputField.font
            elide: Text.ElideRight
            elideWidth: 300
            text: inputField.text
        }

    }

    function validateText(text: string) {
        if(text === "")
            mainText = "0"
        inputFieldRect.width = textMetrics.width
        lbl.anchors.leftMargin = (root.width - (textMetrics.width + lbl.width)) / 2
    }
}
