import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0

Window {
    id: main
    visible: true
    width: 800
    height: 600



     /* StackView {
              id: stack
              initialItem: mainView
              anchors.fill: parent
          }

          Component {
              id: mainView

              Row {
                  spacing: 10

                  Button {
                      text: "Push"
                      onClicked: stack.push(mainView)
                  }
                  Button {
                      text: "Pop"
                      enabled: stack.depth > 1
                      onClicked: stack.pop()

                  }
                  Text {
                      text: stack.depth
                  }
              }
          }
*/

    Image{
        width: 100
        height: 100
        x:15
        y:15
        id:imgFriends
        source:"Ressources/Ecran accueil/amis.png"
        MouseArea {
          anchors.fill: parent
          onClicked: pageLoader.source = "EcranAmis/EcranAmis.qml"
        }



    }
    Image{
        id:imgRating
        width: 100
        height: 100
        x:main.width- (width+15)
        y:15
        source:"Ressources/Ecran accueil/palmares.png"
        MouseArea {
          anchors.fill: parent
          onClicked: pageLoader.source = "EcranPalmares/EcranPalmares.qml"
        }

    }
    Image{
         id:imgCam
        width:100
        height: 100
        x:15
        y:main.height-(height+15)
        source:"Ressources/Ecran accueil/cam.png"
        MouseArea {
          anchors.fill: parent
          onClicked: pageLoader.source = "EcranCamera/EcranCamera.qml"
        }

    }
    Image{
        id:imgGallery
        width:100
        height: 100
        x:main.width-(width+15)
        y:main.height-(height+15)
        source:"Ressources/Ecran accueil/galerie.png"
        MouseArea {
          anchors.fill: parent
          onClicked: pageLoader.source = "EcranGalerie/EcranGalerie.qml"
        }


    }

   /* Item{
        anchors.horizontalCenter: parent.horizontalCenter*/
    ListView{
        id: listNews
       //anchors.fill: parent
        spacing: 10
       anchors.horizontalCenter: parent.horizontalCenter
        //x: (parent.width/2) - (width/2)
        width: 400
        height: parent.height - 100
        model:XmlListModel {
            id: xmlModel
            source: "http://cdn-elle.ladmedia.fr/var/plain_site/storage/flux_rss/fluxMode.xml"
            query: "/rss/channel/item"

            XmlRole { name: "title"; query: "title/string()" }
            XmlRole { name: "pubDate"; query: "pubDate/string()" }
            XmlRole { name: "details"; query: "description/string()" }
            //XmlRole { name: "url"; query: "link/string()" }
            XmlRole { name: "urlImage"; query: "image/url/string()" }
        }
        delegate: RssMode{
           // anchors.horizontalCenter: list.horizontalCenter
            title: model.title
            description: model.details
            pubDate: model.pubDate
            urlImage: model.urlImage
            width: 200
            height: 200
        }

    //}

}
   /* MainForm {
        anchors.fill: parent
        mouseArea.onClicked: {
            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))

    }*/

    Loader { id: pageLoader; focus: true }
}
