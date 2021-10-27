import QtQuick 2.0
import QtQml 2.0


Rectangle{
    id:rect
    x: 0
    y: 0
    width: 150
    height: 124
    opacity: 1
    color: "#00ffffff"
    property string activity: "cup-missing"
    signal pushed

    Image {
        id: cupMissing
        opacity: 1
        width: rect.width
        height: rect.height
        source: "images/cup-missing.png"
        transformOrigin: Item.Center
    }

    Image {
        id: cupOk
        opacity: 0
        width: rect.width
        height: rect.height
        source: "images/cup-ok.png"
        transformOrigin: Item.Center
    }
    Image {
        id: cupFilling
        opacity: 0
        width: rect.width
        height: rect.height
        source: "images/cup-filling.png"
        transformOrigin: Item.Center
    }
    Image {
        id: cupReady
        opacity: 0
        width: rect.width
        height: rect.height
        source: "images/cup-ready.png"
        transformOrigin: Item.Center
    }



    MouseArea {

        x: 0
        y: 0
        width: parent.width
        height: parent.height
        onPressed: {
            parent.scale = 0.95
            parent.pushed()
        }

        onReleased: {
            parent.scale = 1;

            if(activity === "cup-missing"){
                activity = "cup-ok";
                console.log(activity)

                parent.pushed()
            }
           else if(activity === "cup-ok" || activity === "cup-ready"){
                activity = "cup-missing";
                console.log(activity)
                parent.pushed()
            }
        }
    }
    Connections {
        target: activity
        onActivityChanged:{
            if(activity === "cup-missing"){
                cupMissing.opacity = 1;
                cupOk.opacity = 0;
                cupFilling.opacity = 0;
                cupReady.opacity = 0;

            }
            else if(activity === "cup-ok"){
                cupMissing.opacity = 0;
                cupOk.opacity = 1;
                cupFilling.opacity = 0;
                cupReady.opacity = 0;
            }
            else if(activity === "cup-filling"){
                cupMissing.opacity = 0;
                cupOk.opacity = 0;
                cupFilling.opacity = 1;
                cupReady.opacity = 0;
            }
            else if(activity === "cup-ready"){
                cupMissing.opacity = 0;
                cupOk.opacity = 0;
                cupFilling.opacity = 0;
                cupReady.opacity = 1;
            }
            else{
                cupMissing.opacity = 0;
                cupOk.opacity = 0;
                cupFilling.opacity = 0;
                cupReady.opacity = 0;
            }
        }
    }
}
