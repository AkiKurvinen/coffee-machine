import QtQuick 2.0

Rectangle {
    property int speed: 0
    property int direction: 0
    width: 50
    height: 50
    radius: 50
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#000000";
        }
        GradientStop {
            position: 1.00;
            color: "#ffffff";
        }
    }
    color: "black"

    Behavior on x {
        PropertyAnimation {
            duration: 10000 / speed
        }
    }
    Behavior on y {
        PropertyAnimation {
            duration: 10000 / speed
        }
    }
}
