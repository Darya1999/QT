//import QtQuick 2.9

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.10
import QtQuick.Layouts 1.12
import QtMultimedia 5.8
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.12
import Qt.labs.platform 1.1
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0


ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        Drawer {
            id: drawer
            width: 0.4 * parent.width
            height: parent.height
            interactive: stackView.depth === 1
            ListView {
                id: listView
                focus: true
                currentIndex: -1
                anchors.fill: parent

                delegate: ItemDelegate {
                    width: parent.width
                    text: model.title
                    highlighted: ListView.isCurrentItem
                    onClicked: {
                        listView.currentIndex = index
                        stackView.push(model.source)
                        drawer.close()
                    }
                }
                model: ListModel {
                    ListElement { title: "Lab 3"; source: "qrc:/main.qml" }

                }
                ScrollIndicator.vertical: ScrollIndicator { }
            }
        }

        Page {//Лабораfторная работа №1. GUI
            header:Rectangle{
                color:"#ffffff"
                height:50
                width:100
                /*gradient:Gradient{
                    orientation:Gradient.Horizontal
                    GradientStop{
                        color:"blue"
                        position:0.0}
                    GradientStop{
                        color:"green"
                        position:1.0}
                }*/
                Label{
                    //style: {
                    text: "ЛР№1 GUI"
                    //}
                    color:"black"
                    font.italic:true
                    font.family: "Gigi"
                    //anchors.left:parent.left
                    //anchors.bottom:
                    //anchors.top:
                    //anchors.right:
                    //anchors.fill: - сразу 4 границы
                    //если не нужно настраивать габариты, а только центрирование, то используется свойство
                    //anchors.centerIn  сразу гор. и вер.
                    //anchors.verticalCenter
                    //anchors.horizontalCenter
                    anchors.centerIn:parent
                    anchors.margins: 5
                    //font.family: "Lobster"
                    font.pointSize: 24}

                    Image {
                        //id: photoPreview
                        sourceSize.height: 50
                        sourceSize.width: 50
                        source: "qrc:/image/noun_862311_cc.png"
                    }
                    Image{
                        sourceSize.height: 30
                        sourceSize.width: 30
                        anchors.right:parent.right
                        anchors.verticalCenter:parent.verticalCenter
                        source: "qrc:/image/sent.png"}

                }
            GridLayout{
                anchors.fill: parent
                rows: 3
                columns: 3
                Label{
                    text: "1 lab"
                    font.pixelSize: 22
                    //font.italic: true
                    color: "medium violet red"
                    //Layout.fillWidth: true
                    //Layout.preferredHeight: 50

                }

                Button{
                    id: control
                    text: qsTr("Button")
                    font.pixelSize: 16
                    background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: control.down ? "medium violet red" : "#e0e0e0"

                          }
                    /*Layout.fillWidth: true
                    Layout.preferredHeight: 50*/
                }
                Switch{
                    text: qsTr("Button")

                    }
                RadioButton{
                    text: qsTr("1")
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50}
                CheckBox{
                    text: qsTr("First")
                    }
                Slider{
                    from: 1
                    value: 25
                    to: 100
                    }
                Dial{
                    Keys.onLeftPressed: {}
                    }
                Tumbler{
                    id: hoursTumbler
                    model: 12
                    //delegate: delegateComponent
                    }
                ComboBox{
                    model: ["First", "Second", "Third"]
                    }
            }

        }

        Page {//Лабораторная работа №2. Работа с веб ресурсами, безопасная аутентификация ВК
            //dropshadow
            header:Rectangle{
                color:"#ffffff"
                height:50
                width:100

                Label{
                    text: "ЛР№2 Видео"
                    color:"black"
                    font.italic:true
                    anchors.centerIn:parent
                    anchors.margins: 5
                    //font.family: "Lobster"
                    font.pointSize: 24}
                Image {
                        sourceSize.height: 50
                        sourceSize.width: 50
                        source: "qrc:/image/noun_862311_cc.png"
                    }
                Image{
                        sourceSize.height: 30
                        sourceSize.width: 30
                        anchors.right:parent.right
                        anchors.verticalCenter:parent.verticalCenter
                        source: "qrc:/image/sent.png"}
                }
            ColumnLayout{
                anchors.fill: parent
                ComboBox{
                    id: combo
                    textRole: "key"
                    model: ListModel {
                           ListElement { key: "Video"; value: 1 }
                           ListElement { key: "Camera"; value: 2 } // camera.stop()
                    }
                    onCurrentIndexChanged: {
                        cam.stop()
                        if (combo.currentIndex === 0){
                            vioutput.source = mediaplayer
                            //im3.visible = false;
                            mediaplayer.pause()
                            im.visible = true
                            btn1.visible = false
                            im4.visible = false;
                            btn2.visible = false;
                            lab.visible = false;
                            sldr.visible = true
                            btn.visible = true
                            im.visible = true
                            mouse.visible = true
                            photoPreview.visible = false
                            }
                        else {
                            vioutput.source = cam
                            cam.start()
                            mediaplayer.pause()
                            im3.visible = true
                            btn1.visible = true
                            im4.visible = true;
                            btn2.visible = true;
                            lab.visible = true
                            photoPreview.visible = true
                            sldr.visible = false;
                            btn.visible = false;
                            //im.visible = false;
                            //im2.visible = false;
                            mouse.visible = false
                        }


                        //;cam.play()}
                        //(combo.currentIndex === 0)?(mediaplayer):(cam);cam.start()
                        // переключение видеоисточника через if else
                        // не забыть cam.start(), если выбрана камера
                    }
                }
                MediaPlayer {
                    id: mediaplayer
                    source: "qrc:/image/sample.avi"
                    autoLoad: true
                    //autoPlay: true
                    }
                Camera{
                    id: cam
                    videoRecorder.audioEncodingMode: CameraRecorder.ConstantBitrateEncoding;
                    videoRecorder.audioBitRate: 128000
                    videoRecorder.mediaContainer: "mp4"
                    imageCapture {
                        //captureToLocation()
                        onImageCaptured: {
                            // Show the preview in an Image
                            photoPreview.source = preview
                                  }
                              }
                }
                VideoOutput {
                    id: vioutput
                    source : mediaplayer//(combo.currentIndex === 0)?(mediaplayer):(cam)
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    focus : visible
                    }
                Button{
                    id: btn
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 70
                    onClicked: {
                        pushanimation.start()}
                    ScaleAnimator{
                        id: pushanimation
                        target: btn
                        from: 1
                        to: 0.9
                        duration: 200
                        }
                    /*DropShadow{
                        anchors.fill: parent
                        horizontalOffset: 5
                        verticalOffset: 5
                        radius: 8.0
                        samples: 17
                        color: "#80000000"
                        source: btn
                        }*/
                    Image{
                        id: im
                        height: 70
                        width: 70
                        source: "qrc:/image/play.png"
                        fillMode: Image.Stretch
                        property bool pressed: false
                        }
                    Image{
                        id: im2
                        height: 70
                        width: 70
                        source: "qrc:/image/pause.png"
                        fillMode: Image.Stretch
                        property bool pressed: false
                        visible: false
                        }
                    MouseArea{
                        id: mouse
                        anchors.fill: parent
                        onReleased: {
                            im.opacity = 1.0
                        }
                        onPressed: {
                            if (im.pressed == false){
                            im.pressed = true
                            mediaplayer.play()
                            im.visible = false
                            im2.visible = true
                            }
                            else{
                            im.pressed = false
                            mediaplayer.pause()
                            im.visible = true
                            im2.visible = false
                            }
                        }
                        }
                    Layout.alignment: Qt.AlignHCenter // выравнивание по горизонтали
                    font.pixelSize: 16}

                /*ProgressBar{
                    value: sldr.position
                    Layout.fillWidth: true
                    }*/
                Slider{
                    id:sldr
                    from: 0.0
                    to: mediaplayer.duration
                    property bool sync: false
                    onValueChanged: {
                        if (!sync)
                            mediaplayer.seek(value)
                    }
                    Connections {
                        target: mediaplayer
                        onPositionChanged: {
                            sldr.sync = true
                            sldr.value = mediaplayer.position
                            sldr.sync = false
                        if (sldr.value == mediaplayer.duration){
                            sldr.value = 0.0
                            im.visible = true
                            im2.visible = false}
                        }
                        }
                    Layout.fillWidth: true
                }
                Button{
                    id: btn1
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 70
                    onClicked: {
                        pushanimation.start()}
                    Image{
                        id: im3
                        height: 70
                        width: 70
                        source: "qrc:/image/foto.png"
                        fillMode: Image.Stretch
                        property bool pressed: false
                        }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: cam.imageCapture.capture()
                    }
                    Layout.alignment: Qt.AlignHCenter // выравнивание по горизонтали
                }
                Label{
                    id: lab
                    text: qsTr("Gallery")}
                Image {
                    id: photoPreview

                    Layout.preferredWidth: 90
                    Layout.preferredHeight: 70
                    //captureToLocation(location)

                      }
                Button{
                    id: btn2
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 70
                    Layout.alignment: Qt.AlignHCenter
                    onClicked: {
                        pushanimation.start()}
                    Image{
                        id: im4
                        height: 70
                        width: 70
                        source: "qrc:/image/video.jpg"
                        fillMode: Image.Stretch
                        property bool pressed: false
                        }
                    Image{
                        id: im5
                        height: 70
                        width: 70
                        source: "qrc:/image/stop.png"
                        fillMode: Image.Stretch
                        visible: false
                        }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            if (im4.pressed == false){
                            im4.pressed = true
                            cam.videoRecorder.record()
                            im4.visible = false
                            im5.visible = true
                            }
                            else{
                            im4.pressed = false
                            cam.videoRecorder.stop()
                            im4.visible = true
                            im5.visible = false
                            }
                    }
                    Layout.alignment: Qt.AlignHCenter // выравнивание по горизонтали
                }



            }
        }
        }
        Page{//Лабораторная №3
            header:Rectangle{
                color:"#ffffff"
                height:50
                width:100

                Label{
                    //style: {
                    text: "ЛР№3 Видео"
                    //}
                    color:"black"
                    font.italic:true
                    anchors.centerIn:parent
                    anchors.margins: 5
                    //font.family: "Lobster"
                    font.pointSize: 24}
                Image{
                    sourceSize.height: 45
                    sourceSize.width: 45
                    anchors.verticalCenter:parent.verticalCenter
                    source: "qrc:/image/menu.png"
                    visible: true
                //ToolBar {
                        Material.foreground: "white"
                            ToolButton {
                                icon.name: stackView.depth > 1 ? "back" : "drawer"
                                onClicked: {
                                    if (stackView.depth > 1) {
                                        stackView.pop()
                                        listView.currentIndex = -1
                                    } else {
                                        drawer.open()
                                    }
                                }
                            //}
                    }}


                Image{
                        sourceSize.height: 30
                        sourceSize.width: 30
                        anchors.right:parent.right
                        anchors.verticalCenter:parent.verticalCenter
                        source: "qrc:/image/sent.png"}

                }

            StackView {
                        id: stackView
                        anchors.fill: parent

                        initialItem: Pane {
                            id: pane
                        }
                    }
            GridLayout{
                anchors.fill: parent
                rows: 6
                columns: 2
                    //Layout.row: 1
                    //Layout.column: 1
                    //Layout.columnSpan: 2
                Text {
                    text: "FastBlur"
                    Layout.row: 1
                    Layout.column: 1
                    Layout.columnSpan: 2
                    font.pixelSize: 22
                    anchors.horizontalCenter:parent.horizontalCenter
                    font.italic: true
                    }

                Item {
                      width: 150
                      height: 150
                      Image {
                          id: bug
                          source: "qrc:/image/fly.png"
                          sourceSize: Qt.size(parent.width, parent.height)
                          smooth: true
                      }
                      FastBlur {
                          anchors.fill: bug
                          source: bug
                          radius: sl1.position * 15
                      }
                  }
                Slider{
                    id: sl1
                    from: 1
                    to: 100
                }
                Text {
                    text: "LevelAdjust"
                    Layout.row: 3
                    Layout.column: 1
                    Layout.columnSpan: 2
                    font.pixelSize: 22
                    anchors.horizontalCenter:parent.horizontalCenter
                    font.italic: true
                    }
                Item {
                    width: 150
                    height: 150
                    Image {
                        id: butterfly
                        source: "qrc:/image/fly.png"
                        sourceSize: Qt.size(parent.width, parent.height)
                        smooth: true
                        //Layout.row: 1
                        //Layout.column: 1
                        }
                    LevelAdjust {
                        id: level
                        anchors.fill: butterfly
                        source: butterfly
                        //radius: sl2.position
                        visible: false
                        gamma: sl2.position
                        minimumOutput: "#00ffffff"
                        maximumOutput: "#ff000000"
                    }}
                Slider{
                    id: sl2
                    from: 1
                    to: 100
                    }
                Text {
                    text: "InnerShadow"
                    Layout.row: 5
                    Layout.column: 1
                    Layout.columnSpan: 2
                    font.pixelSize: 22
                    anchors.horizontalCenter:parent.horizontalCenter
                    font.italic: true
                    }
                Item {
                      width: 150
                      height: 150
                      Image {
                          id: fly
                          source: "qrc:/image/fly.png"
                          sourceSize: Qt.size(parent.width, parent.height)
                          smooth: true
                          //visible: false
                      }
                      InnerShadow {
                          anchors.fill: fly
                          source: fly
                          radius: sl3.position * 10
                          samples: 16
                          horizontalOffset: -3
                          verticalOffset: 3
                          color: "#b0000000"
                          spread: sl4.position
                          }
                }
                GridLayout{
                    rows: 4
                    columns: 1
                    Text {
                        text: "Radius"
                        font.pixelSize: 14
                        anchors.horizontalCenter:parent.horizontalCenter
                        font.italic: true
                        }
                    Slider{
                        id: sl3
                        from: 1
                        to: 100
                    }
                    Text {
                        text: "Spread"
                        font.pixelSize: 14
                        anchors.horizontalCenter:parent.horizontalCenter
                        font.italic: true
                        }
                    Slider{
                        id: sl4
                        from: 0.0
                        to: 1.0

                    }
                }
        }
    }

        Page{
            header:Rectangle{
                color:"#ffffff"
                height:50
                width:100

                Label{
                    text: "ЛР№4 HTTP"
                    color:"black"
                    font.italic:true
                    anchors.centerIn:parent
                    anchors.margins: 5
                    font.family: "Gigi"
                    //font.family: "Lobster"
                    font.pointSize: 24}
                Image {
                        sourceSize.height: 50
                        sourceSize.width: 50
                        source: "qrc:/image/noun_862311_cc.png"
                    }
                Image{
                        sourceSize.height: 30
                        sourceSize.width: 30
                        anchors.right:parent.right
                        anchors.verticalCenter:parent.verticalCenter
                        source: "qrc:/image/sent.png"}
                }
            ColumnLayout{
                anchors.fill: parent
            Button{
                id: btnn
                text: qsTr("Отправить запрос")
                Layout.alignment: Qt.AlignHCenter
                //anchors.horizontalCenter:parent.horizontalCenter
                font.pixelSize: 16
                }
            TextEdit {
                id: edit
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Получены следующие данные: ")
                width: flick.width
                height: flick.height
                focus: true
                wrapMode: TextEdit.Wrap
                //onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
            }

        }
}
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
        TabButton {
            text: qsTr("Page 3")
        }
        TabButton {
            text: qsTr("Page 4")
        }
    }
}
