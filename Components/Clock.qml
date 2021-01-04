import QtQuick 2.0

ClockRings {
    id: clockRings

    canvasHeight: 360
    canvasWidth: 360
    ClockText {
        id: clockText
        anchors.centerIn: clockRings
    }
}
