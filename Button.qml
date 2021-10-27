import QtQuick 2.0
import QtQml 2.0

Rectangle {
    property string buttonText: "Button"
    signal pushed
    color: "#ffecd2"
    state: "NORMAL"
    radius: 5
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#ffecd2"
        }

        GradientStop {
            position: 1
            color: "#fcb69f"
        }
    }

    Text {
        text: parent.buttonText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.FixedSize
        minimumPointSize: 13
        minimumPixelSize: 15
        font.family: "Arial"
        font.pointSize: 16
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            parent.scale = 0.95
        }
        onReleased: {
            parent.scale = 1.0
            parent.pushed() // lähetetään signaali
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
