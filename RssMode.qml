import QtQuick 2.0

Item {
    property string title
    property string description
    property string pubDate
    property string urlImage
   /* width: 200
    height: 200*/
    //x: (parent.width/2) - (width/2)
    Rectangle{
        radius: width/2
        color: "blue"

        Grid{
            columns: 1
                //spacing: 5

                Rectangle { color: "lightGray"; width: 400; height: 80;
                    Text{ text: title; width: parent.width; height: parent.height; color: "darkGray"; font.pointSize: 15; font.weight: Font.Bold; wrapMode: Text.WrapAnywhere }}
                Rectangle { color: "lightGray"; width: 400; height: 100
                    Text{text: description; width: parent.width; height: parent.height; color: "darkGray"; font.pointSize: 10; wrapMode: Text.WrapAnywhere}}
                Rectangle { color: "lightGray"; width: 400; height: 20
                    Text{ text: pubDate; width: parent.width; height: parent.height; color: "darkGray"; font.pointSize: 15; wrapMode: Text.WrapAnywhere  } }
               // Rectangle { color: "darkGray"; width: 100; height: 100 }
               // Rectangle { color: "magenta"; width: 10; height: 10 }

       }

    }


}
