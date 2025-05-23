cmake_minimum_required(VERSION 3.16)

project(WorkingWithStack VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appWorkingWithStack
    main.cpp
)

qt_add_qml_module(appWorkingWithStack
    URI WorkingWithStack
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES Images.qrc
        QML_FILES Components/Sidebar/Sidebar.qml Components/Sidebar/SidebarHeader.qml
        QML_FILES Components/Sidebar/SidebarFooter.qml
        QML_FILES Components/Sidebar/SidebarList.qml
        SOURCES backendhelper.h backendhelper.cpp
        QML_FILES Components/RightSidePage/BasePage.qml
        QML_FILES Components/RightSidePage/DashboardPage.qml
        QML_FILES Components/RightSidePage/GenericPage.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appWorkingWithStack PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appWorkingWithStack
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appWorkingWithStack
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appWorkingWithStack
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
