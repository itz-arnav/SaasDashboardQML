import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: control

    RowLayout {
        anchors {
            left: parent.left
            right: parent.right
            leftMargin: 15
            rightMargin: 15

            verticalCenter: parent.verticalCenter
        }

        spacing: 5

        Image {
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32

            source: "qrc:/Images/logo.svg"
            fillMode: Image.PreserveAspectFit
        }

        Label {
            Layout.alignment: Qt.AlignVCenter

            text: "PLACIFY"
            color: "#ffffff"

            font.pointSize: 16
            font.weight: Font.DemiBold
        }

        Item {
            Layout.fillWidth: true
        }

        Image {
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32

            source: "qrc:/Images/sidebar_collapse.svg"
            fillMode: Image.PreserveAspectFit
        }
    }
}
