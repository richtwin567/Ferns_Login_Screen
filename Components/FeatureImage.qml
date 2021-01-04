import QtQuick 2.12
import QtQuick.Window 2.2

Image{
    id: featureImage
    source: "../assets/ferns.jpg"
    width: (Screen.width* (2/3))+1
    height: Screen.height
    fillMode: Image.PreserveAspectCrop
}


