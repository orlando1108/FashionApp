import QtQuick 2.6
import QtQuick.Window 2.2
import QtMultimedia 5.9
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0
import QtQuick.Layouts 1.3
import QtLocation 5.9
import QtPositioning 5.8

Item {
    id: window
    visible: true
    width: 800
    height: 600

    property int compteurPhotoPrise : 1
    //property list name: value


    ListModel {
        id: listModelPhoto
        dynamicRoles: true
    }

    Camera {
        id: camera
        // You can adjust various settings in here
        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview  // Show the preview in an Image
            }
        }
    }

    Item{
        id : cameraVideoPage
        visible: true
        anchors.fill: parent
        VideoOutput {
            id: cameraVideo
            visible : true
            source: camera
            autoOrientation: true
            focus : visible
            anchors.fill: parent
            PinchArea{
                anchors.fill: parent
                pinch.minimumScale: 0.5
                pinch.maximumScale: 10
                onPinchFinished: {
                    camera.setDigitalZoom(pinch.scale)
                }
            }

        }
        Rectangle{
            id: buttonReversePhoto
            width: 100
            height: 100
            anchors.top: parent.top
            anchors.margins: 15
            signal clicked
            color: "transparent"
            antialiasing: true

            Image {
                id: backgroundImage
                anchors.fill: parent
                source: ("../Ressources/Ecran camera/frontCam.png")
                fillMode: Image.PreserveAspectFit
                smooth: true
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onPressed: camera.position == Camera.BackFace ? camera.position = Camera.FrontFace : camera.position = Camera.BackFace
            }
        }

        Rectangle {
            id: buttonClosePhoto
            width: 100
            height: 100
            anchors.top: parent.top
            anchors.right: parent.right
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
        Rectangle{
            id: buttonCapturePhoto
            width: 250
            height: 250
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 15
            signal clicked
            color: "transparent"
            antialiasing: true
            opacity: 0.5

            Image {
                id: captureImg
                anchors.fill: parent
                source: ("../Ressources/Ecran camera/take.png")
                //fillMode: Image.PreserveAspectFit
                smooth: true
            }
            MouseArea {
                id: captureArea
                anchors.fill: parent
                onPressed: {
                    cameraVideoPage.visible = false
                    photoPreviewPage.visible = true
                    camera.imageCapture.capture()
                }
            }
        }
    }

    Item {
        id: photoPreviewPage
        anchors.fill:parent
        visible: false
        Image {
            id: photoPreview
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
        Rectangle{
            id: buttonClosePhotoPreview
            width: 100
            height: 100
            anchors.top: parent.top
            anchors.right: parent.right
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
                onPressed: {
                    photoPreviewPage.visible = false
                    cameraVideoPage.visible = true
                }
            }
        }
        Rectangle{
            id: buttonAddPhotoPreview
            width: 100
            height: 100
            anchors.bottom: parent.bottom
            anchors.margins: 15
            signal closed
            color: "transparent"
            antialiasing: true

            Image {
                anchors.fill : parent
                fillMode: Image.PreserveAspectFit
                smooth: true
                source: ("../Ressources/Ecran capture/otherPicture.png")
                visible : window.compteurPhotoPrise < 3 ? true : false
            }
            Button{
                text: "Suivant"
                highlighted: true
                visible : window.compteurPhotoPrise == 3 ? true : false
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    window.compteurPhotoPrise ++
                    listModelPhoto.append({"imagePath" : camera.imageCapture.capturedImagePath})
                    //window.compteurPhotoPrise == 3 ? pageLoader.setSource("EcranRecap.qml") : null

                    console.log(camera.imageCapture.capturedImagePath)
                    photoPreviewPage.visible = false
                    cameraVideoPage.visible = true
                }
            }
        }

        Item{
            height : 200
            width: 200
            Button{
                text: compteurPhotoPrise
                onClicked: {
                    highlighted : true
                }
            }
        }
    }
    EcranRecap {
        listPhotos : listModelPhoto
        //listContact : listModelContact
        visible : window.compteurPhotoPrise > 3 ? true : false
        //source: window.compteurPhotoPrise == 3 ? ("EcranRecap.qml"): "vide"
    }
}
