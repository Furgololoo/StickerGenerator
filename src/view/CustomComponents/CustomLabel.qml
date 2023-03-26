import QtQuick

Item {
    id: root
    property string mainText: "unnamed"
    property color textColor: "#000000"
    property bool alignLeft: false
    property int hAlignment: Qt.AlignHCenter
    property int vAlignment: Qt.AlignVCenter

    function getPaintedWidth() {
        return textLbl.paintedWidth
    }

    Text {
        id: textLbl
        anchors.fill: parent
        text: parent.mainText
        font.family: "Arial"
        font.pointSize: 12
        color: parent.textColor
        horizontalAlignment: hAlignment
        verticalAlignment: vAlignment
    }
}
