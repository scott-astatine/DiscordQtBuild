import QtQuick

Rectangle {
	id: base
	property alias color: base.color
	property alias text: chName.text
	property alias img: userImg.source
	property alias ch: hashtag.visible
	property alias txtColor: base.textColor
	property variant dismissClicked

	property string textColor: "#8f8f8f"
	property string bgColor: "#373737"
	property string state1: "hovered"
	property string state2: "notHovered"
	property bool isActive: false

	signal clicked

	width: 200
	height: 35
	color: bgColor
	radius: 4
	states: [
		State {
			name: state1
			PropertyChanges {
				target: base
				color: "#4f4f4f"
			}
		},
		State {
			name: state2
			PropertyChanges {
				target: base
				color: bgColor
			}
		}
	]

	transitions: [
		Transition {
			from: state2
			to: state1
			ColorAnimation {
				target: base
				duration: 200
			}
		},
		Transition {
			from: state1
			to: state2
			ColorAnimation {
				target: base
				duration: 200
			}
		}
	]

	MouseArea {
		id: hovE
		anchors.fill: parent
		hoverEnabled: true

		// Hover color
		onEntered: {
			if (!isActive) {
				base.state = state1
				textColor = "#f0f0f0"

				if (root.activePage == root.dView)
					closeBtn.visible = true
			}
		}
		onExited: {
			if (!isActive) {
				textColor = "#8f8f8f"
				base.state = state2
				closeBtn.visible = false
			}
		}
		onClicked: base.clicked()
	}

	Rectangle {
		x: 5
		id: rectangle
		width: parent.height - 5
		height: parent.height - 5
		radius: 50
		anchors.verticalCenter: parent.verticalCenter
		color: parent.color

		Image {
			id: userImg
			visible: !hashtag.visible
			asynchronous: true
			fillMode: Image.PreserveAspectCrop
			source: ""
			width: parent.width
			height: parent.height
			anchors.verticalCenter: parent.verticalCenter
		}

		Text {
			id: hashtag
			visible: false
			text: "#"
			font.pixelSize: 25
			font.styleName: "bold"
			font.family: "Tahoma"
			anchors.centerIn: parent
			color: textColor
		}
	}
	Text {
		id: chName
		text: qsTr("Unknown!")
		anchors.verticalCenter: parent.verticalCenter
		font.family: "Arial"
		font.pixelSize: 14
		x: userImg.width + 15
		color: textColor
	}

	Text {
		id: closeBtn
		text: qsTr("×")
		color: textColor
		anchors.verticalCenter: base.verticalCenter
		font.pointSize: 15
		x: base.width - 18
		visible: isActive
		signal clicked

		MouseArea {
			anchors.fill: parent
			onClicked: dismissClicked()
		}
	}
}

/*##^##
Designer {
	D{i:0;height:35;width:2e-323}
}
##^##*/

