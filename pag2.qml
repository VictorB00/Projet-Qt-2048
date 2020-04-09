import QtQuick 2.0


    Page {
        id: firstPage
        tools: ToolBarLayout {
            id: pageSpecificTools
            ToolButton { iconSource: "toolbar-back"; onClicked: Qt.quit() }
            ToolButton { text: "next page"; onClicked: pageStack.push(secondPage) }
        }
    }

