#/*******************************************************************************
#*                                                                              *
#* Author    :  Damir Bakiev                                                    *
#* Version   :  na                                                              *
#* Date      :  01 February 2020                                                *
#* Website   :  na                                                              *
#* Copyright :  Damir Bakiev 2016-2020                                          *
#*                                                                              *
#* License:                                                                     *
#* Use, modification & distribution is subject to Boost Software License Ver 1. *
#* http://www.boost.org/LICENSE_1_0.txt                                         *
#*                                                                              *
#*******************************************************************************/
include(../staticlib.pri)
include(../defines.pri)
include(../suffix.pri)

QT += opengl

TARGET = $$TARGET$$SUFFIX

message($$TARGET)

msvc* {
    LIBS += -lsetupapi -lAdvapi32
    QMAKE_CXXFLAGS += /std:c++latest
    #DEFINES += LEAK_DETECTOR
    LIBS += -l$$_PRO_FILE_PWD_/../lib/clipper$$SUFFIX
    LIBS += -l$$_PRO_FILE_PWD_/../lib/gi$$SUFFIX
    LIBS += -l$$_PRO_FILE_PWD_/../lib/project$$SUFFIX
    LIBS += -l$$_PRO_FILE_PWD_/../lib/settings$$SUFFIX
}

gcc* {
    CONFIG += c++17
    win* {
        LIBS += -lsetupapi -lAdvapi32 -lpsapi
    }
    LIBS += "-L"$$_PRO_FILE_PWD_/../lib
    LIBS += -lclipper$$SUFFIX
    LIBS += -lgi$$SUFFIX
    LIBS += -lproject$$SUFFIX
    LIBS += -lsettings$$SUFFIX
}

linux {
    # sudo apt install mesa-common-dev
    DEFINES += linux
    greaterThan(QT_MINOR_VERSION, 12){
        LIBS += -ltbb # Why????? sudo apt-get install libtbb-dev
    }
}

INCLUDEPATH += ../GGEasy
INCLUDEPATH += ../clipper
INCLUDEPATH += ../gi
INCLUDEPATH += ../project
INCLUDEPATH += ../settings

HEADERS += \
    edid.h \
    qdruler.h \
    graphicsview.h \
    scene.h

SOURCES += \
    edid.cpp \
    qdruler.cpp \
    graphicsview.cpp \
    scene.cpp