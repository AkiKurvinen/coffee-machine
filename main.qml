import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQml 2.3
import QtQml.Models 2.2

Window {
    width: 600
    height: 300
    visible: true
    title: qsTr("Coffee Machine")

    Rectangle {
        id: topBackground
        x: 0
        y: 0
        width: 600
        height: 203
        color: "#29323c"
        gradient: Gradient {
            GradientStop {
                position: 1
                color: "#121921"
            }

            GradientStop {
                position: 0
                color: "#37526f"
            }
        }
    }

    Rectangle {
        id: bottomBackground
        x: 0
        y: 200
        width: 600
        height: 100
        color: "#2a2546"
        gradient: Gradient {
            GradientStop {
                position: 0.07982
                color: "#2a2546"
            }

            GradientStop {
                position: 0.99778
                color: "#07080a"
            }
        }
    }




    ScaleBar {
        id: beansRectangle
        img: "images/bean.png"
        name: "Coffee"
        x: 81
        y: 84
        width: 30
        height: 100
        color: "#03f8d1"
        anchors.bottomMargin: 100
        valuePercent: 100
        valueAmount:100
    }
    ScaleBar{
        id: milkRectangle
        img: "images/milk.png"
        name: "Milk"
        x: 150
        y: 84
        width: 30
        height: 100
        color: "#fff"
        anchors.bottomMargin: 100
        valuePercent: 100
        valueAmount:100
    }

    Timer{
        id:fillingTimer
        repeat:false
        interval:2000
        running:false
        onTriggered:{
        theCup.activity = "cup-ready";
        }
    }
    Button {
        id: coffeeButton
        x: 440
        y: 150
        width: 150
        height: 50


        buttonText: "Coffee"// @disable-check M16
        onPushed: {// @disable-check M16

            if(beansRectangle.valueAmount > 0){
                    if(theCup.activity == "cup-ok"){
                        console.log("Coffee");
                        theCup.activity = "cup-filling";
                        fillingTimer.running = true;
                        beansRectangle.valueAmount = beansRectangle.valueAmount -20;
                        beansRectangle.valuePercent = ( beansRectangle.valueAmount/( beansRectangle.maxPx- beansRectangle.minPx))*100;
                        beansRectangle.height=beansRectangle.valuePercent*(beansRectangle.maxPx-beansRectangle.minPx)/100;
                    }
                   else{console.log("No cup");}
            }
            else{
            console.log("No coffee left");}
            }
    }
    Button {
        id: milkCoffeeButton
        x: 440
        y: 100
        width: 150
        height: 50


        buttonText: "Coffee & Milk"// @disable-check M16
        onPushed: {// @disable-check M16
              if(beansRectangle.valueAmount > 0 &&  milkRectangle.valueAmount > 0){

                    if(theCup.activity == "cup-ok"){

                            console.log("Milk coffee");
                             theCup.activity = "cup-filling";
                            fillingTimer.running = true;
                            beansRectangle.valueAmount = beansRectangle.valueAmount -20;
                            beansRectangle.valuePercent = ( beansRectangle.valueAmount/( beansRectangle.maxPx- beansRectangle.minPx))*100;
                            beansRectangle.height=beansRectangle.valuePercent*(beansRectangle.maxPx-beansRectangle.minPx)/100;

                            milkRectangle.valueAmount = milkRectangle.valueAmount -20;
                            milkRectangle.valuePercent = ( milkRectangle.valueAmount/( milkRectangle.maxPx- milkRectangle.minPx))*100;
                            milkRectangle.height=milkRectangle.valuePercent*(milkRectangle.maxPx-milkRectangle.minPx)/100;
                        }
                      else{console.log("No cup");}
                    }
             else{
             console.log("No ingredients");
              }

        }
    }


    Button {
        id: milkButton
        x: 440
        y: 50
        width: 150
        height: 50
        buttonText: "Milk"// @disable-check M16
        onPushed: {// @disable-check M16

               if( milkRectangle.valueAmount > 0){

                   if(theCup.activity == "cup-ok"){
                       console.log("Milk");
                       theCup.activity = "cup-filling";
                       fillingTimer.running = true;
                        milkRectangle.valueAmount = milkRectangle.valueAmount -20;
                        milkRectangle.valuePercent = ( milkRectangle.valueAmount/( milkRectangle.maxPx- milkRectangle.minPx))*100;
                        milkRectangle.height=milkRectangle.valuePercent*(milkRectangle.maxPx-milkRectangle.minPx)/100;
                   }
                   else{console.log("No cup");}

               }
               else{
               console.log("No milk left");
                }
        }
    }




    Cup{

     id:theCup
     x: 240
     y: 76

    }


    /*
    Machine{
     id:testerEngine
    }

    Connections{
     target: testerEngine
     onBeansReady: {
         beansRectangle.valueAmount = beans
         beansRectangle.valuePercent = ( beansRectangle.valueAmount/( beansRectangle.maxPx- beansRectangle.minPx))*100;
         beansRectangle.height=beansRectangle.valuePercent*(beansRectangle.maxPx-beansRectangle.minPx)/100;
         console.log('valueAmount: '+beansRectangle.valueAmount);
         console.log('height: '+beansRectangle.height);

        }
    }
    */


}







/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}
}
##^##*/
