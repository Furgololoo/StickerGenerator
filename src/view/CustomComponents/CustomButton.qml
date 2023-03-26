import QtQuick

Item {
    id: root
    property string mainText: "undefined"
    property color mainColor: "#F1F1F5"
    property color hoverColor: "#D1F1F5"

    signal pressed()

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "#F1F1F5"
        Text {
            anchors.fill: parent
            text: mainText
            font.family: "Arial"
            font.pointSize: 12
            color: "#444488"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onPressed: root.pressed()
            hoverEnabled: true
            onContainsMouseChanged: {
                if(containsMouse) {
                    mainRect.color = hoverColor
                }
                else {
                    mainRect.color = mainColor
                }
            }
        }
    }
}
