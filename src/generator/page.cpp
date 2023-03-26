//
// Created by bfurg on 26/02/2023.
//

#include "page.h"

namespace gen {
Page::Page() {
  pageColor = std::make_shared<cv::Scalar>(cv::Scalar(255, 255, 255));
  // CreateBasicPage(1280, 720);
}

Page::~Page() {}

void Page::CreateBasicPage(const uint16_t &width, const uint16_t &height) {
  image = cv::Mat(height, width, CV_8UC3, *pageColor);
}

void Page::CreateCustomPage(const uint16_t &width, const uint16_t &height,
                            const uint8_t &r, const uint8_t &g,
                            const uint8_t &b) {
  if (!image.empty())
    image.release(); // maybe ask for save?
  pageColor = std::make_shared<cv::Scalar>(cv::Scalar(r, g, b));
  image = cv::Mat(height, width, CV_8UC3, *pageColor);

  OnUpdate();
}

void Page::AddSticker(const std::string &name, cv::Rect &rect) {
  std::unique_ptr<Sticker> sticker =
      std::make_unique<Sticker>(Sticker(image, rect));
  sticker->SetPageColor(pageColor);
  sticker->DrawRectangle();
  stickers.insert({name, std::move(sticker)});
  OnUpdate();
}

void Page::ShowCurrentImage(const int time) {
  cv::imshow("BasicImage", image);
  std::cout << "Created basic image" << std::endl;
  std::cout << "Parameters: " << std::endl;
  std::cout << "\twidth: " << image.cols << " height: " << image.rows
            << std::endl;

  cv::waitKey(time);
  cv::destroyWindow("BasicImage");
}

void Page::ChangeStickerSize(const std::string &name, const cv::Rect &rect) {
  stickers.at(name)->ResizeSticker(rect);
  OnUpdate();
}

void Page::DrawCircle(const int &x, const int &y) {
  cv::circle(image, cv::Point(x, y), 10, cv::Scalar(0, 0, 255), 4,
             cv::LineTypes::FILLED, 0);
  OnUpdate();
}

void Page::SetUpdateFunction(std::function<void()> func) {
  updateFunction = func;
}

cv::Mat Page::GetImage() const { return image; }

void Page::OnUpdate() { updateFunction(); }

} // namespace gen
