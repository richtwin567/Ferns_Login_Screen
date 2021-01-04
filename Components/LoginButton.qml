import QtQuick 2.12
import QtQuick.Controls 2.4

Button{
    id: loginButton

    property bool fieldFilled
    property RalewayFontLoader raleway: RalewayFontLoader{}

    text: "LOG IN"
    hoverEnabled: true
    display: AbstractButton.TextOnly
    enabled: fieldFilled


    states: [
        State {
            name: "enabled"
            when: loginButton.fieldFilled

            PropertyChanges {
                target: loginButton
            }

            PropertyChanges {
                target: loginButtonBg
                color: "#577A47"
            }

            PropertyChanges {
                target: loginButtonText
                color: "#E8E8D9"
            }

        }
    ]

    transitions: [

        Transition {
            id: transition
            reversible: true
            from: "*"
            to: "*"

            ColorAnimation {
                target: loginButtonBg
                duration: 200
            }

            ColorAnimation {
                target: loginButtonText
                duration: 200
            }
        }
    ]

    background: Rectangle{
        id:loginButtonBg
        color: "#e8e8d9"
        anchors.centerIn: parent
        border.color: "#00000000"
        border.width: 0
        width: loginButtonText.width*1.6
        height: loginButtonText.height*1.4

    }

    contentItem: Text{
        id: loginButtonText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: raleway.name
        font.pointSize: 18
        text: loginButton.text
        color: "#9aa985"
        anchors.centerIn: loginButton
    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
