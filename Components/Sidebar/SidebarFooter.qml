import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: control

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            leftMargin: 15
            rightMargin: 15

            verticalCenter: parent.verticalCenter
        }

        height: 40
        radius: 10

        color: footerMouseArea.containsMouse ? Qt.darker("#5641f4", 1.3) : "#5641f4"

        Behavior on color {
            ColorAnimation {
                duration: 300
            }
        }

        RowLayout {
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 20
            }

            spacing: 10

            Image {
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24

                source: "qrc:/Images/plus.svg"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                Layout.alignment: Qt.AlignVCenter

                text: "Add Item"
                color: "#ffffff"

                font.pointSize: 12
                font.weight: Font.DemiBold
            }
        }

        MouseArea {
            id: footerMouseArea

            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }
}
