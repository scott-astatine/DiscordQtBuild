#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[]) {
  QApplication app(argc, argv);
  QQmlApplicationEngine engine;

  const QUrl url("qrc:/Quax/ui/main.qml");
  QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](const QObject* obj, const QUrl& objUrl) {
          if (!obj && url == objUrl) QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
