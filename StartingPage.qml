
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.Controls 2.14

Item {


    Grid {
        id: grid1
        x: 214
        y: 11
        width: 145
        height: 50
        spacing: 5
        rows: 1
        columns: 2
    }


    Item {
        id: element1
        width: 400
        height: 500

        Rectangle {
            id: rectangleacceuil
            x: 0
            y: 0
            width: 400
            height: 500
            color: "#f5f5dc"

            Text {
                id: element
                x: 118
                y: 111
                width: 119
                height: 14
                text: qsTr("ACCUEIL")
                font.bold: true
                font.pixelSize: 30
            }
        }
    }
}
