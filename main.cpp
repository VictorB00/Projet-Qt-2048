#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <iostream>

#include <plateau2048.h>

using namespace std;

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


    //partie test de la classe Plateau2048
    Plateau2048 plateau;
    cout<<plateau;

    plateau.set(2,0,4);
    cout<<plateau;

    plateau.coup('z');
    cout<<plateau;
    plateau.set(1,0,4);
    plateau.set(2,0,4);
    plateau.set(3,0,4);
    cout<<plateau;

    plateau.coup('z');
    cout<<plateau;

    plateau.ajout();
    cout<<plateau;

    plateau.ajout();
    cout<<plateau;

    cout<<plateau.restePlace()<<endl;

    return app.exec();
}
