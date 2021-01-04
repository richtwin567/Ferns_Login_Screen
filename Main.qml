import "Components"
import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

RowLayout{
    id:main

    property bool loginFailed: false

    spacing: 0
    anchors.fill: parent
    FeatureImage{
        Layout.preferredHeight: 1;
        Layout.preferredWidth: Screen.width* 0.55
        Layout.fillHeight: true;
        Layout.fillWidth: true;
        fillMode: Image.PreserveAspectCrop
    }
    Panel{
        id: panel
        Layout.preferredHeight: 1
        Layout.preferredWidth:Screen.width* 0.45
        Layout.fillHeight: true
        ColumnLayout{
            spacing: 8
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            height: parent.height*0.95
            width: parent.width *0.7

            Clock{
                id:clock
                Layout.preferredHeight: canvasHeight > canvasWidth? canvasHeight: canvasWidth
                Layout.preferredWidth: canvasHeight > canvasWidth? canvasHeight: canvasWidth
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            }

            Column {
                id: column
                width: 200
                height: 400
                Layout.topMargin: 20
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                spacing: 15
                Layout.fillWidth: true
                Layout.fillHeight: true

                UserWelcomeText {
                    id: userWelcomeText
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillHeight: false
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

                PasswordInput{
                    id: password
                    width:parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillHeight: false
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredHeight: 40
                    Keys.onEnterPressed: main.login();
                    Keys.onReturnPressed: main.login();
                    loginFailed: main.loginFailed

                }

                LoginButton{
                    id: loginBtn
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillHeight: false
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    fieldFilled: password.filledText
                    onClicked: main.login();
                    Keys.onEnterPressed: main.login();
                    Keys.onReturnPressed: main.login();
                }
            }

            ControlBar {
                id: controlBar
                Layout.bottomMargin: config.ShowSystemControlButtonLabels==="true"? 10: 0
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            }

        }
    }

    function login(){

        var user = userWelcomeText.selectedUser
        var pass = password.password;

        sddm.login(user,pass,sessionModel.lastIndex);
    }

    Connections {
        target: sddm
        onLoginSucceeded: {
        }
        onLoginFailed: {
            loginFailed = true
            if(resetError.running){
                resetError.stop();
                resetError.start();
            else{
                resetError.start();
            }
        }
    }

    Timer {
        id: resetError
        interval: 4000
        onTriggered: loginFailed = false
        running: false
    }
}

