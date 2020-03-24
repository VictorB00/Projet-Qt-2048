import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 400
    height: 400
    title: qsTr("Hello World")

    Grid {
        id: grid
        x: 106
        y: 48
        width: 300
        height: 300
        transformOrigin: Item.Center
        rows: 3
        columns: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            id: rectangle
            width: 200
            height: 200
            color: "#ffffff"
        }

        Rectangle {
            id: rectangle1
            width: 200
            height: 200
            color: "#ffffff"
        }

        Rectangle {
            id: rectangle2
            width: 200
            height: 200
            color: "#ffffff"
        }

        Rectangle {
            id: rectangle3
            width: 200
            height: 200
            color: "#ffffff"
        }

        Rectangle {
            id: rectangle4
            width: 200
            height: 200
            color: "#ffffff"
        }
    }


}

/*##^##
Designer {
    D{i:1;anchors_height:400;anchors_width:400;anchors_x:106;anchors_y:48}
}
##^##*/
