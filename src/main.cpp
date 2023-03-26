#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <memory>

#include "opencvimageprovider.h"
#include "pagemanager.h"
#include "resizablesticker.h"

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  std::unique_ptr<ui::OpenCVImageProvider> opencvImageProvider =
      std::make_unique<ui::OpenCVImageProvider>();

  engine.rootContext()->setContextProperty("OpencvImageProvider",
                                           opencvImageProvider.get());

  ui::PageManager *pageManager(new ui::PageManager);

  engine.rootContext()->setContextProperty("PageManager", pageManager);

  engine.addImageProvider("ImageProvider", opencvImageProvider.get());

  pageManager->SetImageProvider(std::move(opencvImageProvider));

  const QUrl url(u"qrc:/view/main.qml"_qs);
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
