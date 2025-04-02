import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

Page {
    id: control

    background: null

    header: SidebarHeader {
        height: 70
        width: parent.width
    }

    footer: SidebarFooter {
        height: 100
    }

    SidebarList {
        anchors.fill: parent
    }
}
