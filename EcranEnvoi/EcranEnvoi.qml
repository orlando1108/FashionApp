import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Item{
    property var selectedPhotosList
    width: 840
    height: 800

    Image{
        anchors.fill: parent
        source: "../Ressources/background.jpg"
    }

    ListModel{
        id: selectedModel
        ListElement{
            url: "../Ressources/images1.jpg"
        }
        ListElement{
            url: "../Ressources/images2.jpg"
        }
        ListElement{
            url: "../Ressources/images3.jpg"
        }

    }

    ListView{
        anchors.horizontalCenter: parent.horizontalCenter
        width:400
        spacing: 3
        orientation: ListView.Horizontal
        model: selectedModel
        delegate:
            Image{
                width: 100
                height: 100
                //anchors.fill: parent
                source: url
            }
    }

    ListModel{
        id: friendsModel
        ListElement{
            firstName: "Francois"
            lastName: "Pignon"
        }
        ListElement{
            firstName: "Bill"
            lastName: "Gates"
        }
    }

    ListView{
        id: friendsList
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.fill: parent
        y:100
        width:400
        height: 600
        spacing: 3
        model: friendsModel
        delegate: RowLayout{
            id: contactLayout
            //anchors.fill: friendsList
            spacing: 6
            height:100
            Image{
                id:contactPhoto
                width: friendsList.width/3
                height: 5
                source:"user.png"
            }

            Rectangle{
                color:"transparent"
                height: 50
                width:200


                Text{

                text: firstName + " " + lastName
                font.pointSize: 20
                color:"white"

            }
            }

            CheckBox {

                    //text: qsTr("Breakfast")
                    checked: true
                }
    }

}
}
