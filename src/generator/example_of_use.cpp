#include <iostream>
#include "Page.h"

int main() {

    gen::Page page;
    page.AddSticker("sticker1");
    page.ShowCurrentImage(1000);
    page.ChangeStickerSize("sticker1", 200, 100);
    page.ShowCurrentImage(1000);
    page.ChangeStickerSize("sticker1", 100, 200);
    page.ShowCurrentImage(1000);
    page.ChangeStickerSize("sticker1", 200, 200);
    page.ShowCurrentImage(0);
    return 0;
}
