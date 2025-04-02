import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

import WorkingWithStack

Page {
    id: control

    background: Rectangle {
        color: "#101010"
    }

    header: Item {

        height: 70

        RowLayout {
            anchors {
                left: parent.left
                right: parent.right

                leftMargin: 15
                rightMargin: 15

                verticalCenter: parent.verticalCenter
            }

            Label {
                text: BackendHelper.getSelectedName()
                color: "#ffffff"

                font.pointSize: 20
                font.weight: Font.DemiBold
            }

            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40

                color: profileMouseArea.containsMouse ? "white" : "101010"
                radius: 20

                antialiasing: true

                border.width: 1
                border.color: "#ffffff"

                Behavior on color {
                    ColorAnimation {
                        duration: 300
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "T"
                    color: profileMouseArea.containsMouse ? "#000000" : "#ffffff"
                    font.pointSize: 16
                    font.weight: Font.DemiBold
                }

                MouseArea {
                    id: profileMouseArea

                    anchors.fill: parent
                    hoverEnabled: true

                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
}
