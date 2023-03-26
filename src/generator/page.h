//
// Created by bfurg on 26/02/2023.
//

#ifndef STICKGEN_PAGE_H
#define STICKGEN_PAGE_H

#include "sticker.h"
#include <functional>
#include <iostream>
#include <map>
#include <memory>
#include <opencv2/opencv.hpp>

namespace gen {

class Page {

public:
  explicit Page();
  ~Page();

  void CreateCustomPage(const uint16_t &width, const uint16_t &height,
                        const uint8_t &r, const uint8_t &g, const uint8_t &b);

  void AddSticker(const std::string &name, cv::Rect &rect);

  void ShowCurrentImage(const int time);

  void ChangeStickerSize(const std::string &name, const cv::Rect &rect);

  void DrawCircle(const int &x, const int &y);

  void SetUpdateFunction(std::function<void()> func);

  cv::Mat GetImage() const;

private:
  void OnUpdate();

  void CreateBasicPage(const uint16_t &width, const uint16_t &height);

  cv::Mat image;
  std::shared_ptr<cv::Scalar> pageColor;
  std::map<std::string, std::unique_ptr<Sticker>> stickers;

  std::function<void()> updateFunction;
};

} // namespace gen

#endif // STICKGEN_PAGE_H
