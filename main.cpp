#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <iostream>


#include <plateau2048.h>

using namespace std;

int main(int argc, char *argv[])
{
    Plateau2048 plateau;

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    try{

        plateau.ajout();

        QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                         &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
        engine.rootContext()->setContextProperty("plateau", &plateau);

        engine.load(url);
    }
    catch (const char* message ) {
        cout << " Probleme : " << message << endl ;
        return 0;
    }
    catch (bad_alloc) {
        cout << "Problème d'allocation mémoire" ;
        return 0;
    }
    catch (...) {
        cout << "Autre problème" ;
        return 0;
    }

    return app.exec();
}
