import QtQuick 2.0
import QtQml 2.0

Item {
    property int beans: 100
    signal beansReady(int beans);

    function generateBeans(){
        beans = Math.random()*100;
        beansReady(beans)
    }

    Timer{
    repeat:true
        interval:2000
        running:true
        onTriggered:{
        generateBeans();
        }
    }
}
