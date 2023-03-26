#ifndef STICKERMANAGER_H
#define STICKERMANAGER_H

#include <QObject>

namespace ui {
class StickerManager : public QObject {
  Q_OBJECT
public:
  explicit StickerManager(QObject *parent = nullptr);
};
} // namespace ui

#endif // STICKERMANAGER_H
