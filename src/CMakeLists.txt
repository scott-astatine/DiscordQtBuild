file(GLOB_RECURSE SOURCES ${CMAKE_SOURCE_DIR}/src/*.*pp)

qt_add_executable(${PROJECT_NAME}O ${SOURCES})

set_source_files_properties(images/arch-linux-logo.png PROPERTIES
    QT_RESOURCE_ALIAS ui/images/arch-linux-logo.png
)

qt_add_qml_module(${PROJECT_NAME}O
    URI Quax
    VERSION 1.0
    QML_FILES
        ui/ChannelItem.qml
        ui/main.qml
        ui/MainView.qml
        ui/MessageItem.qml
        ui/SidebarItem.qml
        ui/ChatArea.qml

    RESOURCES
        ui/images/arch-linux-icon.png
        ui/images/pinwheel.png

)
target_include_directories(${PROJECT_NAME}O PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

target_compile_definitions(${PROJECT_NAME}O
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME}O
    PRIVATE Qt6::Quick Qt6::Widgets Qt6::QuickControls2 )

