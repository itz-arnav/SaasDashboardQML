import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

BasePage {
    id: control

    ColumnLayout {
        id: dashboardColumnLayout

        anchors {
            fill: parent
            margins: 10
            topMargin: 30
        }
        spacing: 20

        ListModel {
            id: cardModel
            ListElement {
                cardName: "Today's interactions"
                cardValue: 300
            }
            ListElement {
                cardName: "This week's interactions"
                cardValue: 2343
            }
            ListElement {
                cardName: "This month's interactions"
                cardValue: 23543
            }
            ListElement {
                cardName: "This year's interactions"
                cardValue: 854653
            }
            ListElement {
                cardName: "Total interactions"
                cardValue: 9543333
            }
        }

        GridView {
            id: cardGridView

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: Math.floor(dashboardColumnLayout.width/cellWidth) * cellWidth
            Layout.fillHeight: true

            cellWidth: 300
            cellHeight: 150

            model: cardModel
            delegate: cardGridDelegate
        }

        Component {
            id: cardGridDelegate
            Item {
                id: cardGridItem

                required property string cardName
                required property int cardValue
                required property int index

                width: cardGridView.cellWidth
                height: cardGridView.cellHeight

                x: index === 4 ? cardGridView.cellWidth/2 : 0

                onXChanged: {
                    if(index === 4 && x !== cardGridView.cellWidth/2) {
                        x = cardGridView.cellWidth/2
                    }
                }

                Rectangle {
                    anchors {
                        fill: parent
                        margins: 10
                    }

                    color: "#1b1b1b"
                    radius: 10

                    RowLayout {
                        anchors {
                            left: parent.left
                            right: parent.right
                            top: parent.top
                            leftMargin: 10
                            rightMargin: 10
                            topMargin: 15
                        }
                        spacing: 5

                        Image {
                            Layout.preferredWidth: 16
                            Layout.preferredHeight: 16
                            source: "qrc:/Images/click.svg"
                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            text: cardGridItem.cardName
                            color: "#777"
                            font.pointSize: 11
                            font.weight: Font.DemiBold
                        }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: cardGridItem.cardValue
                        color: "#ffffff"
                        font.pointSize: 15
                        font.weight: Font.DemiBold
                    }
                }

            }
        }
    }
}
