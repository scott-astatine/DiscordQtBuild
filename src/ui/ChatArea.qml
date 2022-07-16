import QtQuick
import QtQuick.Controls

Rectangle {
	id: chatAreaType
	property int widthExclude: channelList.width + sidebar.width
	property alias color: chatAreaType.color
	x: channelList.width
	width: root.width - widthExclude
	height: root.height
	color: root.color
	// border.width: 1

	/// Top Bar
	Rectangle {
		id: topBar
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.top: parent.top
		height: 40
		width: parent.width - 2
		color: "#3f3f3f"
		radius: 2
	}

	/// Seprator
	Rectangle {
		id: topSep
		height: 1
		width: parent.width
		color: "#101010"
		y: topBar.height
		anchors.horizontalCenter: parent.horizontalCenter
	}

	Rectangle {
		y: topBar.height + 10
		anchors.horizontalCenter: chatAreaType.horizontalCenter
		height: chatAreaType.height - topBar.height - messageInputRect.height - 10
		width: chatAreaType.width - 26
		color: root.color

		ListView {
			id: messageList
			clip: true
			anchors.top: parent.top
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			anchors.right: parent.right
			model: 30
			ScrollBar.vertical: ScrollBar {
				parent: messageList.parent
				anchors.top: messageList.top
				anchors.bottom: messageList.bottom
				x: chatAreaType.width - 30
			}
			delegate: MessageItem {
				message: "Wassup dude! What's going on here? Wassup dude! What's going on here"
				img: "images/arch-linux-icon.png"
				onClicked: {
					console.log("Sup!")
				}
			}
		}
	}

	Rectangle {
		id: messageInputRect
		anchors.horizontalCenter: parent.horizontalCenter
		width: parent.width - 8
		height: 35
		radius: 6
		y: parent.height - 40
		color: "#2c2c2f"
		TextEdit {
			id: messageInput
			anchors.fill: parent
			font.pointSize: 10
			font.family: "Arial"
			padding: 10
			color: "#f2f2f2"
			text: "Type what you to text that person..."
			onFocusChanged: messageInput.clear()
		}
	}
}
