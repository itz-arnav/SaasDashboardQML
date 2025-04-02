import QtQuick
import QtQuick.Layouts

import WorkingWithStack

Item {
    id: control

    ListModel {
        id: sidebarListModel
        ListElement {
            name: "Dashboard"
            imageSource: "qrc:/Images/mail.svg"
        }
        ListElement {
            name: "Collection"
            imageSource: "qrc:/Images/database.svg"
        }
        ListElement {
            name: "Statistics"
            imageSource: "qrc:/Images/chart.svg"
        }
        ListElement {
            name: "My Posts"
            imageSource: "qrc:/Images/post.svg"
        }
        ListElement {
            name: "Admin Panel"
            imageSource: "qrc:/Images/admin.svg"
        }
    }

    ListView {
        id: sidebarListView

        anchors {
            fill: parent

            leftMargin: 15
            rightMargin: 15
            topMargin: 50
            bottomMargin: 50
        }

        spacing: 10

        model: sidebarListModel
        delegate: sidebarListDelegate

        currentIndex: BackendHelper.selectedSection
    }

    Component {
        id: sidebarListDelegate
        Rectangle {
            id: sidebarItemRectangle
            required property string name
            required property int index
            required property string imageSource

            width: parent.width
            height: 40
            radius: 10

            color: index === BackendHelper.selectedSection ? "#5641f4"
                                                          : sidebarItemMouseArea.containsMouse ?
                                                                Qt.lighter("#1b1b1b", 1.5) : "#1b1b1b"

            Behavior on color {
                ColorAnimation { duration: 300 }
            }

            RowLayout {
                anchors {
                    left: parent.left
                    leftMargin: 20

                    verticalCenter: parent.verticalCenter
                }

                spacing: 10

                Image {
                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24

                    source: sidebarItemRectangle.imageSource
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    Layout.alignment: Qt.AlignVCenter
                    text: sidebarItemRectangle.name
                    color: "#ffffff"

                    font.pointSize: 12
                    font.weight: Font.DemiBold
                }
            }

            MouseArea {
                id: sidebarItemMouseArea

                anchors.fill: parent

                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: BackendHelper.selectedSection = index
            }
        }
    }
}
