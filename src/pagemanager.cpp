#include "pagemanager.h"

namespace ui {

PageManager::PageManager(QObject *parent) : QObject{parent} {
  const auto updateFunction = [this]() { UpdateImage(); };
  page.SetUpdateFunction(updateFunction);
}

void PageManager::SetImageProvider(
    std::unique_ptr<OpenCVImageProvider> img_prov) {

  imageProvider = std::move(img_prov); // too much std::move
}

void PageManager::UpdateImage() {
  cv::Mat image = page.GetImage();
  imageProvider->updateImage(
      QImage(image.data, image.cols, image.rows, QImage::Format_BGR888)
          .rgbSwapped());
}

void PageManager::createNewPage(const uint16_t width, const uint16_t height) {
  page.CreateCustomPage(width, height, 255, 255, 255);
  // page.DrawCircle(150, 150);
}

void PageManager::addRectangle() {
  cv::Rect rect = cv::Rect(150, 150, 200, 125);
  page.AddSticker("sticker1", rect);
  emit displayNewRectangle(rect.x, rect.y, rect.width, rect.height);
}

void PageManager::resizeRectangle(const quint16 x, const quint16 y,
                                  const quint16 width, const quint16 height) {
  page.ChangeStickerSize(selectedSticker, {x, y, width, height});
}

void PageManager::addEllipse() { emit displayNewEllipse(); }

void PageManager::addText() { emit displayNewText(); }

void PageManager::selectSticker(const quint16 x, const quint16 y) {}

} // namespace ui
