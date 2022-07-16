import QtQuick
import QtQuick.Controls

Rectangle {
	color: root.color
	anchors.fill: parent
	property int activeItemIndex: 0

	/// Channel List
	Rectangle {
		id: channelList
		radius: 6
		height: root.height
		width: root.channelListWidth
		color: "#3f3f3f"

		// Top bar
		Rectangle {
			id: chListViewTopBar
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.top: parent.top
			height: 40
			width: parent.width
			color: parent.color
			radius: 0

			Rectangle {
				id: chIBox
				width: parent.width - 25
				height: parent.height - 14
				anchors.centerIn: parent
				radius: 5
				color: "#191919"
				visible: root.activePage != root.sView
				TextInput {
					id: frF
					anchors.fill: parent
					padding: 6
					color: "#f2f2f2"
					text: "Search..."
					onFocusChanged: frF.clear()
				}
			}

			Label {
				text: qsTr("Server " + (root.currentServer + 1))
				color: "#e3e3e3"
				anchors.centerIn: parent
				visible: !chIBox.visible
				font.pixelSize: 20
				wrapMode: Qt.TextWordWrap
			}
		}
		Rectangle {
			color: "#101010"
			height: 1
			width: parent.width
			y: chListViewTopBar.height
		}

		// List
		Rectangle {
			width: parent.width - 20
			height: parent.height - chListViewTopBar.height
			y: chListViewTopBar.height + 8
			color: parent.color
			anchors.horizontalCenter: parent.horizontalCenter

			ListView {
				id: channelListView
				anchors.top: parent.top
				anchors.bottom: parent.bottom
				anchors.right: parent.right
				anchors.left: parent.left
				spacing: 8
				clip: true
				ScrollBar.vertical: ScrollBar {
					parent: channelListView.parent
					anchors.top: channelListView.top
					anchors.bottom: channelListView.bottom
					x: channelList.width - 18
					width: 8
				}

				model: 30
				delegate: ChannelItem {
					property int index: model.index
					property var imglis: ["images/pinwheel.png", "images/arch-linux-icon.png"]
					ch: root.activePage == root.sView
					color: index === activeItemIndex ? "#474747" : "#373737"
					isActive: index === activeItemIndex
					text: "Elexis"
					img: imglis[Math.floor(Math.random() * 2)]
					onClicked: {
						console.log("This your friend!")
						activeItemIndex = index
						this.isActive = true
					}
					dismissClicked: () => console.log("Chat Dismissed!")
				}
			}
			ScrollBar {}
		}
	}

	/// Message Area
	ChatArea {}
}
