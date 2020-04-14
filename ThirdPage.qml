
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.Controls 2.14


Window {
    id: window
    visible: true
    width: 400
    height: 500
    color: "#f5f5dc"
    title: qsTr("Jeu de 2048")
    Rectangle {
        id: rectangle16
        x: 34
        y: 127
        width: 325
        height: 325
        color: "#c8ad7f"
        border.color: "#000000c8"


        Grid {
            id: grid
            x: 8
            y: 18
            width: 315
            height: 315
            visible: true
            clip: true
            flow: Grid.LeftToRight
            anchors.verticalCenterOffset: 0
            spacing: 5
            anchors.horizontalCenterOffset: 0
            rows: 5
            columns: 5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Rectangle {
                id: rectangle
                width: 59
                height: 59
                color: (element.text === "2"
                           ? '#a58c5f'
                           : element.text === "4"
                           ? '#b0976a'
                           : element.text === "8"
                           ? '#bca274'
                           : element.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                border.color: "#c8ad7f"

                Text {
                    id: element
                    text: plateau.listePlateau[0]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle1
                width: 59
                height: 59
                color: (element4.text === "2"
                           ? '#a58c5f'
                           : element4.text === "4"
                           ? '#b0976a'
                           : element4.text === "8"
                           ? '#bca274'
                           : element4.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                border.color: "#c8ad7f"

                Text {
                    id: element4
                    text: plateau.listePlateau[5]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle2
                width: 59
                height: 59
                color: (element8.text === "2"
                           ? '#a58c5f'
                           : element8.text === "4"
                           ? '#b0976a'
                           : element8.text === "8"
                           ? '#bca274'
                           : element8.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element8
                    text: plateau.listePlateau[10]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle3
                width: 59
                height: 59
                color: (element12.text === "2"
                           ? '#a58c5f'
                           : element12.text === "4"
                           ? '#b0976a'
                           : element12.text === "8"
                           ? '#bca274'
                           : element12.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element12
                    text: plateau.listePlateau[15]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle4
                width: 59
                height: 59
                color: (element1.text === "2"
                           ? '#a58c5f'
                           : element1.text === "4"
                           ? '#b0976a'
                           : element1.text === "8"
                           ? '#bca274'
                           : element1.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element1
                    text: plateau.listePlateau[20]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle5
                width: 59
                height: 59
                color: (element5.text === "2"
                           ? '#a58c5f'
                           : element5.text === "4"
                           ? '#b0976a'
                           : element5.text === "8"
                           ? '#bca274'
                           : element5.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element5
                    text: plateau.listePlateau[1]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle6
                width: 59
                height: 59
                color: (element9.text === "2"
                           ? '#a58c5f'
                           : element9.text === "4"
                           ? '#b0976a'
                           : element9.text === "8"
                           ? '#bca274'
                           : element9.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element9
                    text: plateau.listePlateau[6]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle7
                width: 59
                height: 59
                color: (element13.text === "2"
                           ? '#a58c5f'
                           : element13.text === "4"
                           ? '#b0976a'
                           : element13.text === "8"
                           ? '#bca274'
                           : element13.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element13
                    text: plateau.listePlateau[11]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle8
                width: 59
                height: 59
                color: (element2.text === "2"
                           ? '#a58c5f'
                           : element2.text === "4"
                           ? '#b0976a'
                           : element2.text === "8"
                           ? '#bca274'
                           : element2.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element2
                    text: plateau.listePlateau[16]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle9
                width: 59
                height: 59
                color: (element6.text === "2"
                           ? '#a58c5f'
                           : element6.text === "4"
                           ? '#b0976a'
                           : element6.text === "8"
                           ? '#bca274'
                           : element6.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element6
                    text: plateau.listePlateau[21]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle10
                width: 59
                height: 59
                color: (element10.text === "2"
                           ? '#a58c5f'
                           : element10.text === "4"
                           ? '#b0976a'
                           : element10.text === "8"
                           ? '#bca274'
                           : element10.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element10
                    text: plateau.listePlateau[2]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle11
                width: 59
                height: 59
                color: (element14.text === "2"
                           ? '#a58c5f'
                           : element14.text === "4"
                           ? '#b0976a'
                           : element14.text === "8"
                           ? '#bca274'
                           : element14.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element14
                    text: plateau.listePlateau[7]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle12
                width: 59
                height: 59
                color: (element3.text === "2"
                           ? '#a58c5f'
                           : element3.text === "4"
                           ? '#b0976a'
                           : element3.text === "8"
                           ? '#bca274'
                           : element3.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element3
                    text: plateau.listePlateau[12]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle13
                width: 59
                height: 59
                color: (element7.text === "2"
                           ? '#a58c5f'
                           : element7.text === "4"
                           ? '#b0976a'
                           : element7.text === "8"
                           ? '#bca274'
                           : element7.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element7
                    text: plateau.listePlateau[17]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle14
                width: 59
                height: 59
                color: (element11.text === "2"
                           ? '#a58c5f'
                           : element11.text === "4"
                           ? '#b0976a'
                           : element11.text === "8"
                           ? '#bca274'
                           : element11.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element11
                    text: plateau.listePlateau[22]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle15
                width: 59
                height: 59
                color: (element15.text === "2"
                           ? '#a58c5f'
                           : element15.text === "4"
                           ? '#b0976a'
                           : element15.text === "8"
                           ? '#bca274'
                           : element15.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )

                Text {
                    id: element15
                    text: plateau.listePlateau[3]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle19
                width: 59
                height: 59
                color: (element17.text === "2"
                           ? '#a58c5f'
                           : element17.text === "4"
                           ? '#b0976a'
                           : element17.text === "8"
                           ? '#bca274'
                           : element17.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element17
                    text: plateau.listePlateau[8]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle20
                width: 59
                height: 59
                color: (element19.text === "2"
                           ? '#a58c5f'
                           : element19.text === "4"
                           ? '#b0976a'
                           : element19.text === "8"
                           ? '#bca274'
                           : element19.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element19
                    text: plateau.listePlateau[13]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle21
                width: 59
                height: 59
                color: (element20.text === "2"
                           ? '#a58c5f'
                           : element20.text === "4"
                           ? '#b0976a'
                           : element20.text === "8"
                           ? '#bca274'
                           : element20.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element20
                    text: plateau.listePlateau[18]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle22
                width: 59
                height: 59
                color: (element21.text === "2"
                           ? '#a58c5f'
                           : element21.text === "4"
                           ? '#b0976a'
                           : element21.text === "8"
                           ? '#bca274'
                           : element21.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element21
                    text: plateau.listePlateau[23]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle23
                width: 59
                height: 59
                color: (element22.text === "2"
                           ? '#a58c5f'
                           : element22.text === "4"
                           ? '#b0976a'
                           : element22.text === "8"
                           ? '#bca274'
                           : element22.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element22
                    text: plateau.listePlateau[4]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle24
                width: 59
                height: 59
                color: (element23.text === "2"
                           ? '#a58c5f'
                           : element23.text === "4"
                           ? '#b0976a'
                           : element23.text === "8"
                           ? '#bca274'
                           : element23.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element23
                    text: plateau.listePlateau[9]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle25
                width: 59
                height: 59
                color: (element24.text === "2"
                           ? '#a58c5f'
                           : element24.text === "4"
                           ? '#b0976a'
                           : element24.text === "8"
                           ? '#bca274'
                           : element24.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element24
                    text: plateau.listePlateau[14]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle26
                width: 59
                height: 59
                color: (element25.text === "2"
                           ? '#a58c5f'
                           : element25.text === "4"
                           ? '#b0976a'
                           : element25.text === "8"
                           ? '#bca274'
                           : element25.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element25
                    text: plateau.listePlateau[19]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle27
                width: 59
                height: 59
                color: (element26.text === "2"
                           ? '#a58c5f'
                           : element26.text === "4"
                           ? '#b0976a'
                           : element26.text === "8"
                           ? '#bca274'
                           : element26.text === "16"
                           ? '#c8ad7f'
                           : '#d4b88a' )
                Text {
                    id: element26
                    text: plateau.listePlateau[24]
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

        }
    }

    Grid {
        id: grid1
        x: 207
        y: 15
        width: 145
        height: 50
        spacing: 5
        rows: 1
        columns: 2

        Rectangle {
            id: rectangle17
            width: 70
            height: 50
            color: "#c8ad7f"

            Text {
                id: element16
                x: 0
                width: 70
                height: 25
                color: "#ffffff"
                text: qsTr("Score")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 12
            }

            Text {
                id: score
                width: 70
                height: 25
                text: plateau.score
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: rectangle18
            width: 70
            height: 50
            color: "#c8ad7f"

            Text {
                id: element18
                width: 70
                height: 25
                color: "#ffffff"
                text: qsTr("Score Max")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

            Text {
                id: scoreBest
                width: 70
                height: 25
                text: plateau.scoreMax
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }
        }
    }

    Text {
        id: text2048
        x: 34
        y: 15
        width: 129
        height: 28
        text: qsTr("2048")
        font.bold: true
        font.pixelSize: 30
    }

    Button {
        id: reset
        x: 69
        y: 64
        text: qsTr("Nouvelle Partie")
        highlighted: true
        checkable: false
        onClicked: plateau.reset();
        focus: true
        Keys.onPressed: {
            switch (event.key) {
            case Qt.Key_Up:
                plateau.coup(2);
                break;
            case Qt.Key_Down:
                plateau.coup(3);
                break;
            case Qt.Key_Left:
                plateau.coup(0);
                break;
            case Qt.Key_Right:
                plateau.coup(1);
                break;
            }
        }
    }
    Rectangle {
        id: rectangle28
        x: 218
        y: 78
        width: 126
        height: 33
        color: "#ffffff"
        border.color: "#ed5a5a"

        Text {
            id: etatPartie
            text: plateau.partieFinie
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }
    }
}

/*##^##
Designer {
    D{i:38;anchors_y:0}
}
##^##*/
