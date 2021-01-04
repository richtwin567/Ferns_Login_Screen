import QtQuick 2.12
import QtQuick.Controls 2.4
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Row{
    id: welcomeTextRow

    property string selectedUser: userText.currentText.toLocaleLowerCase()
    property RalewayFontLoader raleway: RalewayFontLoader{}

    Text {
        id: welcomeText
        color: "#514a30"
        text: "Welcome back, "
        font.family: raleway.name
        font.pointSize: 20
    }

    ComboBox{
        id: userText
        flat: true
        model: userModel
        currentIndex: userModel.lastIndex
        font.family: raleway.name

        textRole: "name"

        delegate: ItemDelegate{
            width: parent.width
            contentItem: Text {
                id: delegateText
                text: model.name
                font.capitalization: Font.Capitalize
                font.family: raleway.name
                font.pointSize: 20
                color: "#1C2E1E"

            }
            background: Rectangle{
                anchors.fill: parent
                color: "#9AA985"
                border.width: 0
                border.color: "#00000000"
            }
        }

        contentItem: Text{
            id: usernameText
           color: "#577a47"
            font.family: raleway.name
            font.pointSize: 20
            text: userText.displayText
            font.capitalization: Font.Capitalize
        }

        background: Rectangle{
            width:parent.width
            height: parent.height
            color: "#00000000"
        }

       onCurrentIndexChanged: {
           selectedUser = currentText.toLowerCase();
       }
       onCurrentTextChanged: {
                  selectedUser = currentText.toLowerCase();
              }

    }
    
    Component.onCompleted: {
        welcomeTextRow.selectedUser = userText.currentText.toLowerCase();
    }

}

