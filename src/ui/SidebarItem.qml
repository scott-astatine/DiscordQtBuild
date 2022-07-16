import QtQuick

Rectangle {
	id: base
	width: parent.width
	height: 52
	color: "#1c1c1c"

	property alias img: logo.source
	property alias active: base.isActive
	property alias logoBg: serverLogo.color
	property alias serverName: base.name
	property string name: ""

	property bool isActive: false

	signal clicked

	property int scaleDuration: 150

	Rectangle {
		id: activeIndicator
		height: isActive ? parent.height - 8 : 5
		anchors.verticalCenter: base.verticalCenter
		radius: 50
		width: !isActive ? 12 : 13
		x: -9
		color: "#fcfcfc"
		Behavior on height {
			NumberAnimation {
				target: activeIndicator
				property: "height"
				duration: 200
			}
		}
	}

	Rectangle {
		id: serverLogo
		anchors.horizontalCenter: parent.horizontalCenter
		width: 50
		height: 50
		radius: 30
		antialiasing: true

		MouseArea {
			id: eventA
			anchors.fill: parent
			hoverEnabled: true
			onEntered: {
				parent.radius = 15
				parent.scale = 1.1
				if (!isActive)
					activeIndicator.height = base.height - 22
			}
			onExited: {
				parent.radius = 30
				parent.scale = 1
				activeIndicator.height = isActive ? parent.height - 2 : 5
			}

			onClicked: {
				base.clicked()
			}
		}

		Image {
			id: logo
			fillMode: Image.PreserveAspectFit
			asynchronous: true
			antialiasing: true
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			height: 34
			width: 32
			source: "Image path not defined!"

			Behavior on scale {
				NumberAnimation {
					duration: scaleDuration
				}
			}
		}

		Behavior on radius {
			NumberAnimation {
				duration: scaleDuration
			}
		}
	}
}
