//
// Created by bfurg on 25/02/2023.
//

#ifndef STICKGEN_STICKER_H
#define STICKGEN_STICKER_H

#include <iostream>
#include <memory>
#include <opencv2/opencv.hpp>

namespace gen {

class Sticker {

public:
  Sticker(cv::Mat &mat, cv::Rect _rect);
  ~Sticker();

  void ResizeSticker(const cv::Rect &_rect);
  void SetPageColor(std::shared_ptr<cv::Scalar> _color);
  void DrawRectangle();

protected:
  void RemovePreviouslyRectangle();

  cv::Rect rect;
  cv::Scalar color;
  cv::Mat &baseImage;

  std::shared_ptr<cv::Scalar> pageColor;
};

} // namespace gen

#endif // STICKGEN_STICKER_H
