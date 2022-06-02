# campuscollab

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```
campuscollab
├─ .gitignore
├─ .metadata
├─ analysis_options.yaml
├─ android
│  ├─ .gitignore
│  ├─ .gradle
│  │  ├─ 6.7
│  │  │  ├─ executionHistory
│  │  │  │  ├─ executionHistory.bin
│  │  │  │  └─ executionHistory.lock
│  │  │  ├─ fileChanges
│  │  │  │  └─ last-build.bin
│  │  │  ├─ fileHashes
│  │  │  │  ├─ fileHashes.bin
│  │  │  │  ├─ fileHashes.lock
│  │  │  │  └─ resourceHashesCache.bin
│  │  │  ├─ gc.properties
│  │  │  ├─ javaCompile
│  │  │  │  ├─ classAnalysis.bin
│  │  │  │  ├─ jarAnalysis.bin
│  │  │  │  ├─ javaCompile.lock
│  │  │  │  └─ taskHistory.bin
│  │  │  └─ vcsMetadata-1
│  │  ├─ buildOutputCleanup
│  │  │  ├─ buildOutputCleanup.lock
│  │  │  ├─ cache.properties
│  │  │  └─ outputFiles.bin
│  │  ├─ checksums
│  │  │  ├─ checksums.lock
│  │  │  ├─ md5-checksums.bin
│  │  │  └─ sha1-checksums.bin
│  │  ├─ configuration-cache
│  │  │  └─ gc.properties
│  │  └─ vcs-1
│  │     └─ gc.properties
│  ├─ app
│  │  ├─ build.gradle
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ com
│  │     │  │     └─ example
│  │     │  │        └─ campuscollab
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ drawable-v21
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ values
│  │     │     │  └─ styles.xml
│  │     │     └─ values-night
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  └─ settings.gradle
├─ assets
│  └─ images
│     └─ campuscollab-var2-nobackground-coloredtext-nogradientmask.png
├─ ios
│  ├─ .gitignore
│  ├─ Flutter
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  ├─ flutter_export_environment.sh
│  │  ├─ Generated.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  ├─ AppIcon.appiconset
│  │  │  │  ├─ Contents.json
│  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  └─ LaunchImage.imageset
│  │  │     ├─ Contents.json
│  │  │     ├─ LaunchImage.png
│  │  │     ├─ LaunchImage@2x.png
│  │  │     ├─ LaunchImage@3x.png
│  │  │     └─ README.md
│  │  ├─ Base.lproj
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ GeneratedPluginRegistrant.h
│  │  ├─ GeneratedPluginRegistrant.m
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  ├─ contents.xcworkspacedata
│  │  │  └─ xcshareddata
│  │  │     ├─ IDEWorkspaceChecks.plist
│  │  │     └─ WorkspaceSettings.xcsettings
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  └─ Runner.xcworkspace
│     ├─ contents.xcworkspacedata
│     └─ xcshareddata
│        ├─ IDEWorkspaceChecks.plist
│        └─ WorkspaceSettings.xcsettings
├─ lib
│  ├─ data
│  │  ├─ get_controllers.dart
│  │  ├─ services
│  │  │  ├─ announcements
│  │  │  │  ├─ get_announcements_service.dart
│  │  │  │  └─ model
│  │  │  │     └─ announcement_response_model.dart
│  │  │  ├─ attendings
│  │  │  │  ├─ get_attendings_service.dart
│  │  │  │  ├─ get_total_attendings_service.dart
│  │  │  │  └─ model
│  │  │  │     ├─ get_attendings_request_model.dart
│  │  │  │     ├─ get_attendings_response_model.dart
│  │  │  │     └─ get_total_attendings_response_model.dart
│  │  │  ├─ bookmarks
│  │  │  │  ├─ get_bookmarks_service.dart
│  │  │  │  └─ model
│  │  │  │     ├─ get_bookmarks_request_model.dart
│  │  │  │     └─ get_bookmarks_response_model.dart
│  │  │  ├─ create_announcement
│  │  │  │  ├─ create_announcement_service.dart
│  │  │  │  └─ model
│  │  │  │     ├─ create_announcement_request_model.dart
│  │  │  │     └─ create_announcement_response_model.dart
│  │  │  ├─ create_post
│  │  │  │  ├─ create_post_service.dart
│  │  │  │  └─ model
│  │  │  │     ├─ create_post_request_model.dart
│  │  │  │     └─ create_post_response_model.dart
│  │  │  ├─ home
│  │  │  │  ├─ home_service.dart
│  │  │  │  └─ model
│  │  │  │     └─ home_response_model.dart
│  │  │  ├─ login
│  │  │  │  ├─ login_service.dart
│  │  │  │  └─ model
│  │  │  │     ├─ login_request_model.dart
│  │  │  │     └─ login_response_model.dart
│  │  │  └─ register
│  │  │     ├─ model
│  │  │     │  ├─ register_request_model.dart
│  │  │     │  └─ register_response_model.dart
│  │  │     └─ register_service.dart
│  │  ├─ src
│  │  │  ├─ colors.dart
│  │  │  ├─ images.dart
│  │  │  └─ strings.dart
│  │  └─ util
│  │     └─ routing
│  │        └─ get_pages.dart
│  ├─ main.dart
│  └─ views
│     ├─ about
│     ├─ announcements
│     │  ├─ announcements_page.dart
│     │  └─ announcement_controller.dart
│     ├─ bookmarks
│     │  ├─ bookmarks_controller.dart
│     │  └─ bookmarks_page.dart
│     ├─ create_announcement
│     │  ├─ create_announcement_controller.dart
│     │  └─ create_announcement_page.dart
│     ├─ create_post
│     │  ├─ checkbox_controller.dart
│     │  ├─ create_post_controller.dart
│     │  └─ create_post_page.dart
│     ├─ homepage
│     │  ├─ attendings_controller.dart
│     │  ├─ attendings_page.dart
│     │  ├─ get_total_attendings_controller.dart
│     │  ├─ home_controller.dart
│     │  └─ home_page.dart
│     ├─ login
│     │  ├─ login_controller.dart
│     │  └─ login_page.dart
│     ├─ meeting_details
│     │  ├─ meeting_details_controller.dart
│     │  └─ meeting_details_page.dart
│     ├─ post
│     │  └─ post.dart
│     ├─ profile
│     │  ├─ profile_controller.dart
│     │  ├─ profile_page.dart
│     │  └─ user.dart
│     └─ register
│        ├─ register_controller.dart
│        └─ register_page.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
├─ test
│  └─ widget_test.dart
├─ web
│  ├─ favicon.png
│  ├─ icons
│  │  ├─ Icon-192.png
│  │  ├─ Icon-512.png
│  │  ├─ Icon-maskable-192.png
│  │  └─ Icon-maskable-512.png
│  ├─ index.html
│  └─ manifest.json
└─ windows
   ├─ .gitignore
   ├─ CMakeLists.txt
   ├─ flutter
   │  ├─ CMakeLists.txt
   │  ├─ ephemeral
   │  │  └─ .plugin_symlinks
   │  ├─ generated_plugins.cmake
   │  ├─ generated_plugin_registrant.cc
   │  └─ generated_plugin_registrant.h
   └─ runner
      ├─ CMakeLists.txt
      ├─ flutter_window.cpp
      ├─ flutter_window.h
      ├─ main.cpp
      ├─ resource.h
      ├─ resources
      │  └─ app_icon.ico
      ├─ runner.exe.manifest
      ├─ Runner.rc
      ├─ utils.cpp
      ├─ utils.h
      ├─ win32_window.cpp
      └─ win32_window.h

```