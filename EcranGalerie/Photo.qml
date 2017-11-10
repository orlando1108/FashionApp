import QtQuick 2.0

Item {
    //to do     alias
    property alias photoUrl:img.source
    Rectangle{
        width:100
        height: 100
        //color: "black"

        Image{
            id:img
            anchors.fill: parent
        }
    }

}
