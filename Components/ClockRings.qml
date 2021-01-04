import QtQuick 2.12

Canvas{
    property real canvasHeight
    property real canvasWidth
    property real minuteRadians: 0
    property real hourRadians: 0
    property real ninetyDegrees: 90*(Math.PI/180)
    property real thirtyDegrees: 30*(Math.PI/180)

    id: clockRings
    width: canvasHeight > canvasWidth? canvasHeight : canvasWidth
    height:canvasHeight > canvasWidth? canvasHeight : canvasWidth

    contextType: qsTr("2d")
    onPaint: {
        var ctx = getContext("2d");
        context.clearRect(0, 0, width, height);
        var x = width/2;
        var y=height/2;

        ctx.beginPath();
        ctx.strokeStyle="#9AA985";
        ctx.lineWidth = 15
        var radius = width/2;
        radius -= ctx.lineWidth;

        ctx.arc(x,y, radius,  -0.5*Math.PI, hourRadians);
        ctx.stroke();

        ctx.beginPath();
        ctx.strokeStyle="#577A47";
        ctx.lineWidth = 5
        radius -= ctx.lineWidth;
        ctx.arc(x,y, radius, -0.5*Math.PI, minuteRadians);

        ctx.stroke();

    }

    function updateHourArc(){
        const date = new Date();
        var hour = date.getHours();
        if (hour>12){
            hour-=12;
        }
        var radians;
        switch(hour){
        case 0:
        case 12:
            radians = thirtyDegrees*12;
            break;
        case 1:
            radians = thirtyDegrees;
            break;
        case 2:
            radians = thirtyDegrees*2;
            break;
        case 3:
            radians = thirtyDegrees*3;
            break;
        case 4:
            radians =  thirtyDegrees*4;
            break;
        case 5:
            radians =  thirtyDegrees*5;
            break;
        case 6:
            radians =  thirtyDegrees*6;
            break;
        case 7:
            radians =  thirtyDegrees*7;
            break;
        case 8:
            radians =  thirtyDegrees*8;
            break;
        case 9:
            radians =  thirtyDegrees*9;
            break;
        case 10:
            radians =  thirtyDegrees*10;
            break;
        case 11:
            radians =  thirtyDegrees*11;
            break;
        default:
            radians = thirtyDegrees;
        }
        hourRadians = -ninetyDegrees + radians;

    }
    function updateMinuteArc(){
        const date = new Date();
        const currentMinute = date.getMinutes();
        const degrees =  (currentMinute/60)*360;
        const radians = degrees * (Math.PI/180);
        minuteRadians =  -ninetyDegrees + radians;

    }

    Timer{
        id: time
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            updateHourArc()
            updateMinuteArc()
            requestPaint()
        }
    }

    Component.onCompleted: {
        updateHourArc()
        updateMinuteArc()
        requestPaint()
    }
}


