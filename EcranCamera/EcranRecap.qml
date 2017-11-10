import QtQuick 2.6
import QtQuick.Window 2.2
import QtMultimedia 5.9
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0
import QtQuick.Layouts 1.3
import QtLocation 5.9
import QtPositioning 5.8

Rectangle {
    id : ecranRecap
    anchors.fill: parent
    property var listPhotos

    Image{
        anchors.fill: parent
        source: "../Ressources/background.jpg"
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

    ColumnLayout{
        spacing: 2
        anchors.fill: parent
        Rectangle{
            id: buttonAccueil
            Layout.alignment: Qt.AlignRight
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
            anchors.margins: 15

            signal closed
            color: "transparent"
            antialiasing: true

            Image {
                anchors.fill : parent
                fillMode: Image.PreserveAspectFit
                smooth: true
                source: ("../Ressources/Ecran capture/quit.png")
            }

            MouseArea {
                anchors.fill: parent
                onPressed: pageLoader.source=""
            }

        }

        GridView{
            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: 100
            Layout.preferredWidth: 300
            model: listPhotos

            delegate: Image {
                source : "file:///"+imagePath
                width: 100; height: 100
            }
        }
        ListView{
            id: friendsList
            highlightRangeMode: ListView.StrictlyEnforceRange
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            orientation: ListView.Vertical
            Layout.preferredHeight: 200
            Layout.preferredWidth: 400
            spacing: 2
            model: friendsModel
            delegate: RowLayout{
                id: contactLayout
                //anchors.fill: friendsList
                spacing: 2
                height: 50
                Rectangle{
                    color: "transparent"
                    width: 50
                    height: 50

                    Image{
                        anchors.fill: parent
                        id:contactPhoto
                        source:"../EcranEnvoi/user.png"
                    }
                }

                Rectangle{
                    color:"transparent"
                    height: 50
                    width: 230

                    Text{
                        text: firstName + " " + lastName
                        font.pointSize: 18
                        color: "white"
                    }
                }

                Switch {
                    //text: qsTr("Breakfast")
                    checked: false
                    width: 50
                }
            }
        }
        Button{
            Layout.preferredHeight: 50
            Layout.preferredWidth: 100
            Layout.alignment: Qt.AlignCenter
            text: "Suivant"
            highlighted: true
            onClicked: model.submit()
        }
    }
}
