#include "opencvimageprovider.h"

#include <math.h>

namespace ui {

OpenCVImageProvider::OpenCVImageProvider(QObject *parent)
    : QQuickImageProvider(QQuickImageProvider::Image) {
  //  image = QImage(500, 300, QImage::Format_BGR888);
  //  image.fill(QColor("black"));

  //  page.CreateCustomPage(500, 300, 255, 255, 255);
  //  cvImage = page.GetImage();

  //  updateImage(
  //      QImage(cvImage.data, cvImage.cols, cvImage.rows,
  //      QImage::Format_BGR888)
  //          .rgbSwapped());
}

QImage OpenCVImageProvider::requestImage(const QString &id, QSize *size,
                                         const QSize &requestedSize) {
  Q_UNUSED(id);

  if (size) {
    *size = image.size();
  }
  if (requestedSize.width() > 0 && requestedSize.height() > 0) {
    image = image.scaled(requestedSize.width(), requestedSize.height(),
                         Qt::KeepAspectRatio);
  }
  return image;
}

void OpenCVImageProvider::updateImage(const QImage &image) {
  if (!image.isNull() && this->image != image) {
    this->image = image;
    emit imageChanged();
  }
}

} // namespace ui
