import QtQuick 2.0

Rectangle {
    id: container
    property int valueAmount:100
    property int minPx: 0
    property int maxPx: 100
    property int valuePercent: 100
    property string barColor: "#faebd7"
    property string name: "Water"
    property string img: "images/warn.png"


    signal func
    property var func:{
        if(valuePercent < 1){
            warn.visible=true
        }
    }

    height:200
    color: "#faebd7"
    anchors.bottom: parent.bottom

    Behavior on height {

             PropertyAnimation {
                 easing.type:Easing.InOutQuad
                 duration: 500
             }
    }


    Text {
        id: textLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: -20
        color: "#e9f6f7"
        text: qsTr(name)
        font.pixelSize: 12
        minimumPixelSize: 16
    }
    Image {
        id: labelImage
        x: textLabel.x
        y: textLabel.y+20
        width: 31
        height: 31
        source: img
    }

    Image {
        id: warn
        y: labelImage.y-60
        x: labelImage.x
        width: 31
        height: 31
        visible: false
        source: "images/warning.png"
        fillMode: Image.PreserveAspectFit
    }


}


