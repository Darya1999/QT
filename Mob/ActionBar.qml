import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1

ToolBar {
    id: root
    height: 48

    signal menuClicked() // Сигнал, который сообщит о клике по кнопке меню

    Rectangle {
        anchors.fill: parent
        color: "#080808"

        Image {
            id: ico
            height: 36
            width: 36
            anchors {
                left: parent.left
                leftMargin: 10
                top: parent.top
                topMargin: 6
            }
            source: "qrc:/icons/ic_launcher.png"
        }


        Text {
            anchors {
                verticalCenter: parent.verticalCenter
                left: ico.right
                leftMargin: 4
            }

            text: qsTr("QMLMenu")
            font.pixelSize: 18
            color: "white"
        }

        // Начало реализации кнопки меню
        Rectangle {
            width: height
            color: menuArea.pressed ? "#55ffffff" : "transparent"
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }

            Image {
                id: menuIcon
                height: 36
                width: 36
                anchors {
                    centerIn: parent
                }

                source: "qrc:/icons/menu.png"
            }

            MouseArea {
                id: menuArea
                anchors.fill: parent
                onClicked: root.menuClicked()
            }
        }
        // конец реализации кнопки меню
    }
}
