import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.14

Window {
    id: window
    visible: true
    width: 400
    height: 500
    color: "#f5f5dc"
    title: qsTr("Jeu de 2048")

    StackView {
        id: stack
        initialItem: starting_page
        anchors.fill: parent

        StartingPage {
            id: startingPage
        }
    }

    Component {
    id: starting_page
    StartingPage {}

    }
    Component {
    id: second_page
    SecondPage {}

    }

    Row {
        x: 100
        y: 250
        spacing: 10

              Button {
                  text: "2048 4x4"
                  onClicked: stack.push(second_page)
              }
              Button {
                  text: "Retour"
                  enabled: stack.depth > 1
                  onClicked: stack.pop()

              }
              Text {
                  text: stack.depth
              }

}
}




