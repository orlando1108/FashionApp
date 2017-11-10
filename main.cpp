#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "apputils.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    AppUtils myUtils;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("myUtils",&myUtils);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
