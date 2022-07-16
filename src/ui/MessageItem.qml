import QtQuick 2.0

Rectangle {
	id: messgeItemType
	width: root.width - chatAreaType.widthExclude
	implicitHeight: 70
	color: chatAreaType.color
	property alias message: messageText.text
	property alias img: userImg.source
	property alias textColor: messageText.color
	signal clicked

	MouseArea {
		anchors.fill: messgeItemType
		hoverEnabled: true
		onEntered: {
			messgeItemType.color = "#2f2f2f"
		}
		onExited: {
			messgeItemType.color = chatAreaType.color
		}
		onClicked: messgeItemType.clicked()
	}

	Rectangle {
		id: imgR
		height: 40
		width: 40
		x: 10
		radius: 50
		color: "#3f3f3f"
		anchors.verticalCenter: messgeItemType.verticalCenter
		Image {
			id: userImg
			source: "Img Unknown!"
			asynchronous: true
			anchors.centerIn: parent
			height: parent.height - 10
			width: parent.height - 10
		}
	}

	Text {
		id: messageText
		x: imgR.width + 20
		text: message
		font.family: "Carme"
		font.pixelSize: 12
		anchors.verticalCenter: parent.verticalCenter
		color: "#ffffff"
	}
}
