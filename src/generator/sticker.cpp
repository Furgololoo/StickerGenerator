//
// Created by bfurg on 25/02/2023.
//

#include "Sticker.h"

namespace gen {

Sticker::Sticker(cv::Mat &mat, cv::Rect _rect)
    : baseImage(mat), color(cv::Scalar(0, 0, 0)) {
  rect = _rect;
  DrawRectangle();
}

Sticker::~Sticker() {}

void Sticker::ResizeSticker(const cv::Rect &_rect) {
  RemovePreviouslyRectangle();
  rect.width = _rect.width;
  rect.height = _rect.height;
  rect.x = _rect.x;
  rect.y = _rect.y;
  DrawRectangle();
}

void Sticker::DrawRectangle() {
  cv::rectangle(baseImage, rect, color, 4, cv::LineTypes::LINE_8, 0);
}

void Sticker::RemovePreviouslyRectangle() {
  std::cout << "pageColor: " << pageColor.get()->val[0] << " "
            << pageColor.get()->val[1] << " " << pageColor.get()->val[2]
            << std::endl;
  cv::rectangle(baseImage, rect, *pageColor, 4, cv::LineTypes::FILLED, 0);
}

void Sticker::SetPageColor(std::shared_ptr<cv::Scalar> _color) {
  pageColor = _color;
}

} // namespace gen
