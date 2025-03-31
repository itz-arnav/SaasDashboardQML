import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 900
    height: 800
    visible: true

    color: "#1b1b1b"

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // Left Sidebar
        Page {
            id: sidebarPage

            Layout.preferredWidth: 0.3 * parent.width
            Layout.preferredHeight: parent.height

            background: Rectangle {
                color: "#1b1b1b"
            }

            header: Rectangle {
                height: 70
                width: parent.width
                color: "#1b1b1b"

                RowLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 5

                    Image {
                        Layout.preferredWidth: 32
                        Layout.preferredHeight: 32
                        source: "qrc:/Images/logo.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        Layout.alignment: Qt.AlignVCenter
                        text: "PLACIFY"
                        font.pointSize: 16
                        font.weight: Font.DemiBold
                        color: "white"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Image {
                        Layout.preferredWidth: 32
                        Layout.preferredHeight: 32
                        source: "qrc:/Images/plane.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            ListModel {
                id: sidebarListModel
                ListElement {
                    name: "Dashboard"
                }
                ListElement {
                    name: "Collection"
                }
                ListElement {
                    name: "Statistics"
                }
                ListElement {
                    name: "My Posts"
                }
                ListElement {
                    name: "Admin Panel"
                }
            }

            ListView {
                id: sidebarListView

                anchors.fill: parent
                anchors.topMargin: 50
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                spacing: 10

                model: sidebarListModel
                delegate: sidebarListDelegate
                currentIndex: 0
            }

            Component {
                id: sidebarListDelegate
                Rectangle {
                    required property string name
                    required property int index
                    width: parent.width
                    height: 40
                    radius: 10
                    color: index === sidebarListView.currentIndex ? "#5641f4" : sidebarItemMouseArea.containsMouse ? Qt.lighter("#1b1b1b", 1.5) : "#1b1b1b"

                    Behavior on color {
                        ColorAnimation { duration: 300 }
                    }

                    Text {
                        text: name
                        font.pointSize: 14
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.left
                            leftMargin: 20
                        }

                        color: "#fff"
                        font.weight: Font.DemiBold
                    }

                    MouseArea {
                        id: sidebarItemMouseArea
                        hoverEnabled: true
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        onClicked: sidebarListView.currentIndex = index
                    }
                }
            }

            footer: Rectangle {
                height: 100
                color: "transparent"
                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: 15
                        rightMargin: 15
                        verticalCenter: parent.verticalCenter
                    }

                    radius: 10
                    height: 40
                    color: footerMouseArea.containsMouse ? Qt.darker("#5641f4", 1.3) : "#5641f4"

                    Behavior on color {
                        ColorAnimation {
                            duration: 300
                        }
                    }

                    Text {
                        text: "+ Add Item"
                        font.pointSize: 14
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.left
                            leftMargin: 20
                        }

                        color: "#fff"
                        font.weight: Font.DemiBold
                    }

                    MouseArea {
                        id: footerMouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }

        // Right Page -> vary
        Page {
            id: rightPage
            Layout.fillWidth: true
            Layout.fillHeight: true

            background: Rectangle {
                color: "#101010"
            }

            Text {
                id: rightPageText
                anchors.centerIn: parent
                text: sidebarListModel.get(sidebarListView.currentIndex).name
                font.pointSize: 15
                color: "white"
            }
        }
    }
}
