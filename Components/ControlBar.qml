import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

RowLayout {
    id: controlBtns
    height: 60
    spacing: 20

    property RalewayFontLoader raleway: RalewayFontLoader{}

    Repeater{
        id: repeater
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Layout.fillHeight: true
        Layout.fillWidth: true
        model: SystemControlsModel{}

        RoundButton{
            id: roundButton
            display: config.ShowSystemControlButtonLabels==="true"? AbstractButton.TextUnderIcon : AbstractButton.IconOnly
            icon.source: Qt.resolvedUrl(model.pathToIcon)
            icon.width: 60
            icon.height: 60
            icon.color: "#577A47"
            background: Rectangle {
                height: 2
                color: "transparent"
                border.color: "transparent"
                width: parent.width
            }
            Keys.onReturnPressed: clicked()
            Keys.onEnterPressed: clicked()
            onClicked: {
                if(model.name=== "Shutdown"){
                    sddm.powerOff();
                }
                if(model.name==="Restart"){
                    sddm.reboot();
                }
                if(model.name==="Suspend"){
                    sddm.suspend();
                }
                if(model.name==="Hibernate"){
                    sddm.hibernate();
                }
                if(model.name==="Hybrid Sleep"){
                    sddm.hybridSleep();
                }
            }

            Component.onCompleted: {
                if( config.ShowSystemControlButtonLabels==="true"){
                    Qt.createQmlObject(
                                "import QtQuick 2.12; Text {
                id: btnLabel;
                text: model.name;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: -btnLabel.height;
                font.family: raleway.name;
                font.pointSize: 10;
                color: \"#577A47\";
            }",
                                roundButton
                                );
                }
            }
        }
    }
}


