#ifndef OPENCVIMAGEPROVIDER_H
#define OPENCVIMAGEPROVIDER_H

#include <QImage>
#include <QObject>
#include <QQuickImageProvider>
#include <opencv2/opencv.hpp>

#include "generator/page.h"
namespace ui {

class OpenCVImageProvider : public QQuickImageProvider {
  Q_OBJECT
public:
  OpenCVImageProvider(QObject *parent = nullptr);

  QImage requestImage(const QString &id, QSize *size,
                      const QSize &requestedSize) override;

public slots:
  void updateImage(const QImage &image);

signals:
  void imageChanged();

private:
  cv::Point startPoint;

  cv::Mat cvImage;
  QImage image;
  //  gen::Page page;
};
} // namespace ui

#endif // OPENCVIMAGEPROVIDER_H
