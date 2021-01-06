import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

RowLayout{
    id: passwordInput

    property bool filledText: false
    property string password
    property bool loginFailed
    property RalewayFontLoader raleway: RalewayFontLoader{}

    height: 40
    spacing: 0

    Rectangle{
        id: passwordInputLeftBorder
        height: 40
        Layout.alignment: Qt.AlignLeft
        color: "#1C2E1E"
        Layout.maximumWidth: 8
        Layout.minimumWidth: 8
        Layout.fillHeight: true
        Layout.preferredWidth: 8
        Layout.fillWidth: true
        border.color: "#00000000"
        border.width: 0
        Layout.preferredHeight: passwordInputField.height
    }


    states: [
        State {
            name: "focusNoCaps"
            when: passwordInputField.activeFocus && !keyboard.capsLock && !passwordInput.loginFailed

            PropertyChanges {
                target: passwordInputLeftBorder
                color: "#577a47"
            }

            PropertyChanges {
                target: passwordInputRightBorder
                color: "#577a47"
            }

            PropertyChanges {
                target: transition
                reversible: true
            }
        },
        State {
            name: "focusCaps"
            when: passwordInputField.activeFocus && keyboard.capsLock && !passwordInput.loginFailed

            PropertyChanges {
                target: passwordInputLeftBorder
                color: "#577a47"
            }

            PropertyChanges {
                target: passwordInputRightBorder
                color: "#577a47"
            }

            PropertyChanges {
                target: transition
                reversible: true
            }

            PropertyChanges {
                target: capsLockIcon
                opacity: 1
            }
        },
        State {
            name: "incorrectNoCaps"
            when: (passwordInputField.activeFocus && !keyboard.capsLock && passwordInput.loginFailed) || (!passwordInputField.activeFocus && !keyboard.capsLock && passwordInput.loginFailed)

            PropertyChanges {
                target: passwordInputLeftBorder
                color: "#ce5028"
            }

            PropertyChanges {
                target: passwordInputRightBorder
                color: "#ce5028"
            }

            PropertyChanges {
                target: transition
                reversible: true
            }
        },
        State {
            name: "incorrectCaps"
            when: (passwordInputField.activeFocus && keyboard.capsLock && passwordInput.loginFailed)||(!passwordInputField.activeFocus && keyboard.capsLock && passwordInput.loginFailed)

            PropertyChanges {
                target: passwordInputLeftBorder
                color: "#ce5028"
            }

            PropertyChanges {
                target: passwordInputRightBorder
                color: "#ce5028"
            }

            PropertyChanges {
                target: transition
                reversible: true
            }

            PropertyChanges {
                target: capsLockIcon
                source: "../assets/caps_lock_incorrect.svgz"
                opacity: 1
            }
        },
        State {
            name: "noFocusCaps"
            when: !passwordInputField.activeFocus && keyboard.capsLock && !passwordInput.loginFailed

            PropertyChanges {
                target: capsLockIcon
                source: "../assets/caps_lock_nofocus.svgz"
                opacity: 1
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
                target: passwordInputLeftBorder
                duration: 100
            }

            ColorAnimation {
                target: passwordInputRightBorder
                duration: 100
            }

        }
    ]

    Item{
        id: stack
        height: 40
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Layout.fillWidth: true

        TextField{
            id: passwordInputField
            font.family: raleway.name
            Layout.alignment: Qt.AlignHCenter
            echoMode: TextInput.Password
            passwordCharacter: "•"
            background: Rectangle{
                color: "#E8E8D9"
                width: passwordInputField.width
                height: passwordInputField.height
                border.color: "#00000000"
                border.width: 0
            }

            color: "#1C2E1E"
            anchors.fill: parent
            rightPadding: 48
            padding: 8
            passwordMaskDelay: 500
            renderType: Text.QtRendering
            Layout.fillWidth: true
            font.pointSize: 14
            placeholderText: qsTr("Password")
            Layout.fillHeight: false
            onTextChanged: {
                passwordInput.filledText = passwordInputField.text!="";
                passwordInput.password = passwordInputField.text;
            }
        }

        Image {
            id: capsLockIcon
            width: 36
            height:36
            anchors.leftMargin: -36
            anchors.left: passwordInputField.right
            antialiasing: true
            z: 15
            mipmap: true
            anchors.verticalCenter: passwordInputField.verticalCenter
            sourceSize: Qt.size(36,36)
            fillMode: Image.PreserveAspectFit
            source: Qt.resolvedUrl("../assets/caps_lock.svgz")
            opacity: 0
        }
    }

    Rectangle{
        id: passwordInputRightBorder
        height: 40
        Layout.preferredHeight: passwordInputField.height
        color: "#1C2E1E"
        visible: true
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        Layout.maximumWidth: 8
        Layout.minimumWidth: 8
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: 8
        border.color: "#00000000"
        border.width: 0
    }
}
