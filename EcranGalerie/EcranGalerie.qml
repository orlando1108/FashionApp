import QtQuick 2.0
import Qt.labs.folderlistmodel 2.1
import "../EcranEnvoi"

Item {
    id:pageGalerie
    width: 800
    height: 600
    property int nbSelected
     /* ListModel {
        id:photoModel
        ListElement {
            name: "Bill Smith"
            number: "555 3264"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "Sam Wise"
            number: "555 0473"
        }
    }*/

    Rectangle{
    width: parent.width
    height: parent.height
    color: "#E0E0E0"

    GridView {
        id: grid
        width: parent.width
        height: 400
        y: (parent.height/2) -(height/2)
        x: 20
        cellWidth: 110
        cellHeight: 110
        model: galerieModel
        delegate:
            Rectangle {
                width: grid.cellWidth; height: grid.cellHeight
                color: "lightsteelblue"; radius: 5
                Behavior on x { SpringAnimation { spring: 3; damping: 0.2 } }
                Behavior on y { SpringAnimation { spring: 3; damping: 0.2 } }

                Image{
                id: check
                width:parent.width-10
                height:parent.height-10
                source: "../Ressources/Ecran galerie/selected.png"
                visible: false
                z:10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                }
                Photo{  width:grid.cellWidth-10
                        height:grid.cellHeight-10
                        photoUrl: fileURL
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
               }
                MouseArea  {
                        anchors.fill :  parent
                        onClicked :  function(){
                            if(pageGalerie.nbSelected < 3){
                                if(check.visible == true){
                                    check.visible = false
                                    selectedPhotos.remove(pageGalerie.nbSelected)
                                    pageGalerie.nbSelected -=1

                                }else{
                                    check.visible = true
                                    pageGalerie.nbSelected +=1;
                                    selectedPhotos.append({"imagePath": JSON.stringify(fileURL).replace('file:///', '') })

                                }
                            }else{
                                if(check.visible == true){
                                    check.visible = false
                                    pageGalerie.nbSelected -=1
                                }
                            }
                        }
                    }
        }

        highlightFollowsCurrentItem: true
        focus: true

    }


    FolderListModel {
        id:galerieModel
        showDirs:false
        rootFolder: "file:///"+ myUtils.imagePath
        folder: "file:///"+ myUtils.imagePath
        nameFilters: ["*.jpg"]
    }

    Image{
        width: 100
        height: 100
        x:parent.width-(width+15)
        y:parent.height-(height+15)
        source: "../Ressources/Ecran galerie/feedback.png"

        MouseArea{
            anchors.fill: parent
            onPressed:{
                envoiLoader.setSource("../EcranCamera/EcranRecap.qml", {"listPhotos": selectedPhotos })
            }
        }
    }
}
    ListModel{
         id: selectedPhotos
     }
    Loader {
        anchors.fill: parent
        id: envoiLoader; focus: true }



}
