import QtQuick 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property PoiretOneFontLoader poiretOne: PoiretOneFontLoader{}

    id:clockText

    Text{
        id:clockTime
        font.family: poiretOne.name
        font.pointSize: 40
        color: "#514A30"
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        function update(){
            const date = new Date();
            text = Qt.formatTime(date, "hh:mmA");
        }
    }

    Text{
        id:clockWeekday
        font.family: poiretOne.name
        font.pointSize: 14
        color: "#1C2E1E"
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        function update(){
            const date = new Date();
            text =Qt.formatDate(date,"dddd");
        }
    }

    Text {
        id: clockDate
        font.family: poiretOne.name
        font.pointSize: 14
        color: "#1C2E1E"
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        function update(){
            const date =new Date();
            text=Qt.formatDate(date,"MMMM dd, yyyy");

        }
    }

    Timer{
        id: timeDate
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            clockDate.update()
            clockTime.update()
            clockWeekday.update()
        }
    }

    Component.onCompleted: {
        clockDate.update()
        clockTime.update()
        clockWeekday.update()
    }
}

