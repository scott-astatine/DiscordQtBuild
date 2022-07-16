import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
	id: root
	visible: true
	title: qsTr("Skeap")
	width: 850
	height: 600

	color: "#252527"

	property int activePage: dView
	property int dView: 1
	property int sView: 2
	property int channelListWidth: 220
	property int currentServer: 0

	// property string serverImgList: ["/images/pinwheel.png", "/images/arch-linux-icon.png"]
	// property string chNameList: [""]

	/// Server List
	Rectangle {
		id: sidebar
		width: 65
		height: parent.height
		color: "#1c1c1c"
		anchors.verticalCenter: parent.verticalCenter
		anchors.left: parent.left
		anchors.leftMargin: 0
		antialiasing: true

		ScrollView {
			id: serverList
			anchors.fill: parent
			ScrollBar.vertical.policy: Qt.ScrollBarAlwaysOff
			ScrollBar.horizontal.interactive: false

			Column {
				anchors.fill: parent
				bottomPadding: 10
				topPadding: 10
				spacing: 10

				Column {
					id: dmCol
					spacing: 10
					width: serverList.width
					anchors.horizontalCenter: parent.horizontalCenter
					anchors.bottomMargin: 10

					Repeater {
						model: 1
						delegate: SidebarItem {
							id: dmServerListItem
							img: "images/pinwheel.png"
							logoBg: "#2f2f2e"
							onClicked: {
								activePage = dView
							}
							active: activePage == dView
						}
					}

					Rectangle {
						height: 2
						width: 40
						anchors.horizontalCenter: parent.horizontalCenter
						color: "#202020"
					}
				}

				Column {
					id: serverLisCol
					y: dmCol.height + 5
					anchors.horizontalCenter: parent.horizontalCenter
					width: serverList.width
					spacing: 10

					Repeater {
						model: 20
						delegate: SidebarItem {
							logoBg: "#2f2f2e"
							serverName: "Server " + index
							active: activePage == sView
									&& currentServer === index
							img: Math.floor(Math.random() * 3)
								 <= 0 ? "images/pinwheel.png" : "images/arch-linux-icon.png"
							onClicked: {
								activePage = sView
								currentServer = index
							}
						}
					}
				}
			}
		}
	}

	Rectangle {
		id: pageView
		width: root.width - serverList.width
		height: root.height
		color: root.color
		x: serverList.width

		MainView {}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/

