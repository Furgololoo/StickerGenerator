#ifndef PAGEMANAGER_H
#define PAGEMANAGER_H

#include "generator/page.h"
#include "opencvimageprovider.h"
#include <QObject>
#include <memory>

namespace ui {
class PageManager : public QObject {
  Q_OBJECT
public:
  explicit PageManager(QObject *parent = nullptr);

  void SetImageProvider(std::unique_ptr<OpenCVImageProvider> img_prov);

  void UpdateImage();

signals:
  void displayNewRectangle(const quint16 x, const quint16 y,
                           const quint16 width, const quint16 height);
  void displayNewEllipse();
  void displayNewText();

  void openManageRectanglePanel();

public slots:
  void createNewPage(const uint16_t width, const uint16_t height);

  void addRectangle();
  void resizeRectangle(const quint16 x, const quint16 y, const quint16 width,
                       const quint16 height);

  void addEllipse();
  void addText();
  void selectSticker(const quint16 x, const quint16 y);

private:
  gen::Page page;
  std::unique_ptr<OpenCVImageProvider> imageProvider;
  std::string selectedSticker = "sticker1";
};
} // namespace ui

#endif // PAGEMANAGER_H
