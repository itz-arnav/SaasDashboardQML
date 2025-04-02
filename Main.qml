import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

import WorkingWithStack

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
        Sidebar {
            id: sidebarPage

            Layout.preferredWidth: 0.3 * parent.width
            Layout.preferredHeight: parent.height
        }

        // Right Page -> vary color: "#101010"

        StackView {
            id: rightSideStackView

            Layout.fillWidth: true
            Layout.fillHeight: true

            initialItem: BackendHelper.selectedSection === 0 ? dashboardPage : genericPage

            popEnter: null
            popExit: null
            pushEnter: null
            pushExit: null
            replaceEnter: null
            replaceExit: null
        }
    }

    Component {
        id: dashboardPage
        DashboardPage {}
    }

    Component {
        id: genericPage
        GenericPage {}
    }

    Connections {
        target: BackendHelper

        function onSelectedSectionChanged() {
            rightSideStackView.pop(null)
            rightSideStackView.push(BackendHelper.selectedSection === 0 ? dashboardPage : genericPage)
        }
    }
}
