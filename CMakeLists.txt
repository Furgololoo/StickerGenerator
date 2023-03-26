cmake_minimum_required(VERSION 3.24)

project(StickerGenerator VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(OpenCV REQUIRED)
message(STATUS "OpenCV library status: ")
message(STATUS "    version: ${OpenCV_VERSION}")
message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

qt_add_executable(appStickerGenerator
    src/main.cpp
    src/opencvimageprovider.h src/opencvimageprovider.cpp
    src/resizablesticker.h src/resizablesticker.cpp
    src/stickermanager.h src/stickermanager.cpp
    src/pagemanager.h src/pagemanager.cpp

    src/generator/page.h src/generator/page.cpp
    src/generator/sticker.h src/generator/sticker.cpp
    src/resources.qrc
)


set_target_properties(appStickerGenerator PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appStickerGenerator
    PRIVATE Qt6::Quick)
target_link_libraries(appStickerGenerator
    PRIVATE ${OpenCV_LIBS})

install(TARGETS appStickerGenerator
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
