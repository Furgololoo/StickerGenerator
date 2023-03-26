import QtQuick
import "CustomComponents/"

Item {

    function addRectangle(posx: int, posy: int, width: int, height: int) {
        resizableComponent.x = posx
        resizableComponent.y = posy
        resizableComponent.width = width
        resizableComponent.height = height
        resizableComponent.visible = true
    }

    function canBeDragged(mouseX: real, mouseY: real) {
        if(mouseX >= resizableComponent.x && mouseX <= resizableComponent.x + resizableComponent.width)
            if(mouseY >= resizableComponent.y && mouseY <= resizableComponent.y + resizableComponent.height)
                return true
        return false
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: "#FFFFFF"


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            property real previousPointX: 0
            property real previousPointY: 0

            onPressed: {
                if(canBeDragged(mouseX, mouseY)) {
                    resizableComponent.isDragged = true
                    previousPointX = mouseX
                    previousPointY = mouseY
                }
                else {
                    PageManager.selectSticker(mouseX, mouseY)
                }
            }

            onReleased: {
                if(resizableComponent.isDragged) {
                    resizableComponent.isDragged = false
                    resizableComponent.drawNewRectangle()
                }
            }

            onMouseXChanged: {
                if(resizableComponent.isDragged) {
                    resizableComponent.x -= (previousPointX - mouseX)
                    previousPointX = mouseX
                }
            }

            onMouseYChanged: {
                if(resizableComponent.isDragged) {
                    resizableComponent.y -= (previousPointY - mouseY)
                    previousPointY = mouseY
                }
            }
        }


        ResizableComponent{
            id: resizableComponent
            imageHeight: 900
            imageWidth: 1200
            z: 2
            visible: false
        }

        Image {
            id: opencvImage
            anchors.fill: parent
            cache: false
            source: "qrc:/images/orange.png"
            z: 1
            property bool counter: false

            function reload()
            {
                counter = !counter;
                source = "image://imageProvider/image?id=" + counter;
            }
        }
    }

    Connections {
        target: PageManager
        function onDisplayNewRectangle(x, y, width, height) {
            addRectangle(x, y, width, height)
        }
    }

    Connections {
        target: OpencvImageProvider
        function onImageChanged(){
            opencvImage.reload()
        }
    }

}
