#! /bin/bash

abs_path=$(pwd)
app_name=$(basename "$abs_path")

if [ "$app_name" = 'react_native_app' ]; then 
    cd ../../../
    abs_path=$(pwd)
    app_name=$(basename "$abs_path")
fi

# Splash image
input_splash_img=$abs_path/src/app/assets/img/special/splash.png

android_splash_img=$abs_path/android/app/src/main/res/drawable/splashscreen_image.png
ios_splash_img=$abs_path/ios/$app_name/Images.xcassets/SplashScreen.imageset/splashscreen.png

for platform_splash_img in $android_splash_img $ios_splash_img; do 
    if [ -e $platform_splash_img ]; then
        cp $input_splash_img $platform_splash_img
    fi
done

# Expo assets
expo_assets_src_dir_path=$abs_path/src/setup/react_native_app/expo_assets_to_copy
expo_assets_dest_dir_path=$abs_path/assets

if [ -e $expo_assets_dest_dir_path ]; then
    for file in `ls $expo_assets_src_dir_path`; do
        cp $expo_assets_src_dir_path/$file $expo_assets_dest_dir_path/$file
    done;
fi

# Android app icons
android_app_icons_src_dir_path=$abs_path/src/setup/react_native_app/app_icons_to_copy/android
android_app_icons_dest_dir_path=$abs_path/android/app/src/main/res

if [ -e $android_app_icons_dest_dir_path ]; then
    for folder in `ls $android_app_icons_src_dir_path`; do
        cp $android_app_icons_src_dir_path/$folder/ic_launcher.png $android_app_icons_dest_dir_path/$folder/ic_launcher.png
        cp $android_app_icons_src_dir_path/$folder/ic_launcher_round.png $android_app_icons_dest_dir_path/$folder/ic_launcher_round.png
    done;
fi

# IOS app icons
ios_app_icons_src_dir_path=$abs_path/src/setup/react_native_app/app_icons_to_copy/ios/Images.xcassets/AppIcon.appiconset
ios_app_icons_dest_dir_path=$abs_path/ios/$app_name/Images.xcassets/AppIcon.appiconset

if [ -e $ios_app_icons_dest_dir_path ]; then
    for file in `ls $ios_app_icons_src_dir_path`; do
        cp $ios_app_icons_src_dir_path/$file $ios_app_icons_dest_dir_path/$file
    done;
fi