import QtQuick

Item {
    id: root

    property int imageHeight: 0
    property int imageWidth: 0
    property bool isDragged: false

    onXChanged: {
        if(root.x - 7 <= 0)
            root.x = 7
        if(root.x + root.width + 7 >= imageWidth)
            root.x = imageWidth - 7 - root.width
    }

    onYChanged: {
        if(root.y - 7 <= 0)
            root.y = 7
        if(root.y + root.height + 7 >= imageHeight)
            root.y = imageHeight - 7 - root.height
    }

    function drawNewRectangle() {
//        console.log("onDrawNewRectangle");
        PageManager.resizeRectangle(root.x, root.y, root.width, root.height);
    }

    Rectangle{
        id: top_left_btn

        visible: root.visible

        width: 13
        height: 13
        color: "#358FF5"
        border.width: 1
        border.color: "#2C76C9"
        opacity: 0.85
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: -7
        anchors.leftMargin: -7
        MouseArea{
            anchors.fill: parent
            onReleased: drawNewRectangle()

            onMouseYChanged: {
                if((root.y + mouseY) <= 7) {
                    root.height += (root.y - 7)
                    root.y = 7
                }
                else{
                    if((root.height - mouseY) <= 12) {
                        root.y += (root.height - 12)
                        root.height = 12
                    }
                    else {
                        root.y += mouseY
                        root.height -= mouseY
                    }
                }
            }
            onMouseXChanged: {
                if((root.x + mouseX) <= 7) {
                    root.width += (root.x - 7)
                    root.x = 7
                }
                else {
                    if((root.width - mouseX) <= 12) {
                        root.x += (root.width - 12)
                        root.width = 12
                    }
                    else {
                        root.x += mouseX
                        root.width -= mouseX
                    }
                }
            }
        }
    }

    Rectangle{
        id: bottom_left_btn

        visible: root.visible

        width: 13
        height: 13
        color: "#358FF5"
        border.width: 1
        border.color: "#2C76C9"
        opacity: 0.85
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: -7
        anchors.leftMargin: -7
        MouseArea{
            anchors.fill: parent
            onReleased: drawNewRectangle()

            onMouseYChanged: {
                if((root.height + mouseY) + root.y >= (imageHeight-7)) {
                    root.height = (imageHeight - root.y) - 7
                }
                else {
                    if((root.height + mouseY) <= 12){
                        root.height = 12
                    }
                    else{
                        root.height += mouseY
                    }
                }
            }
            onMouseXChanged: {
                if((root.x + mouseX) <= 7) {
                    root.width += (root.x - 7)
                    root.x = 7
                }
                else {
                    if((root.width - mouseX) <= 12) {
                        root.x += (root.width - 12)
                        root.width = 12
                    }
                    else {
                        root.x += mouseX
                        root.width -= mouseX
                    }
                }
            }
        }
    }

    Rectangle{
        id: top_right_btn

        visible: root.visible

        width: 13
        height: 13
        color: "#358FF5"
        border.width: 1
        border.color: "#2C76C9"
        opacity: 0.85
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: -7
        anchors.rightMargin: -7
        MouseArea{
            anchors.fill: parent
            onReleased: drawNewRectangle()

            onMouseYChanged: {
                if((root.y + mouseY) <= 7) {
                    root.height += (root.y - 7)
                    root.y = 7
                }
                else {
                    if((root.height - mouseY) <= 12) {
                        root.y += (root.height - 12)
                        root.height = 12
                    }
                    else {
                        root.y += mouseY
                        root.height -= mouseY
                    }
                }
            }
            onMouseXChanged: {
                if((root.width + mouseX) + root.x >= (imageWidth-7)) {
                    root.width = (imageWidth - root.x) - 7
                }
                else {
                    if((root.width + mouseX) <= 12) {
                        root.width = 12
                    }
                    else {
                        root.width += mouseX
                    }
                }
            }
        }
    }

    Rectangle{
        id: bottom_right_btn

        visible: root.visible

        width: 13
        height: 13
        color: "#358FF5"
        border.width: 1
        border.color: "#2C76C9"
        opacity: 0.85
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: -7
        anchors.rightMargin: -7
        MouseArea{
            anchors.fill: parent
            onReleased: drawNewRectangle()

            onMouseYChanged: {
                if((root.height + mouseY) + root.y >= (imageHeight-7)) {
                    root.height = (imageHeight - root.y) - 7
                }
                else {
                    if((root.height + mouseY) <= 12){
                        root.height = 12
                    }
                    else{
                        root.height += mouseY
                    }
                }
            }
            onMouseXChanged: {
                if((root.width + mouseX) + root.x >= (imageWidth-7)) {
                    root.width = (imageWidth - root.x) - 7
                }
                else {
                    if((root.width + mouseX) <= 12) {
                        root.width = 12
                    }
                    else {
                        root.width += mouseX
                    }
                }
            }
        }
    }

    Rectangle{
        id: top_line

        visible: root.visible

        height: 5
        color: "#358FF5"
        opacity: 0.4
        anchors.left: top_left_btn.right
        anchors.right: top_right_btn.left
        anchors.top: top_left_btn.top
        anchors.topMargin: 4
    }

    Rectangle{
        id: bottom_line

        visible: root.visible

        height: 5
        color: "#358FF5"
        opacity: 0.4
        anchors.left: bottom_left_btn.right
        anchors.right: bottom_right_btn.left
        anchors.top: bottom_left_btn.top
        anchors.topMargin: 4
    }

    Rectangle{
        id: left_line

        visible: root.visible

        width: 5
        color: "#358FF5"
        opacity: 0.4
        anchors.top: top_left_btn.bottom
        anchors.bottom: bottom_left_btn.top
        anchors.left: bottom_left_btn.left
        anchors.leftMargin: 4
    }

    Rectangle{
        id: right_line

        visible: root.visible

        width: 5
        color: "#358FF5"
        opacity: 0.4
        anchors.top: top_right_btn.bottom
        anchors.bottom: bottom_right_btn.top
        anchors.left: bottom_right_btn.left
        anchors.leftMargin: 4
    }
}
