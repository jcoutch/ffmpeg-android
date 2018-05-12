FFmpeg-Android
==============

This repo is a work-in-progress to update the WritingMinds/ffmpeg-android build scripts to work with newer versions of FFmpeg.  Primary focus will be on armv7-neon, since I have a project that requires it.

* FFmpeg for Android compiled with x264, libass, fontconfig, freetype and fribidi
* Supports Android L

Supported Architecture
----
* armv7
* armv7-neon
* x86

Instructions
----
* Set environment variable
  1. export ANDROID_NDK={Android NDK Base Path}
* Run following commands to compile ffmpeg
  1. sudo apt-get --quiet --yes install build-essential git subversion autoconf libtool pkg-config gperf gettext yasm python-lxml docbook2x
  2. ./init_update_libs.sh
  3. ./android_build.sh
* To update submodules and libraries you can use ./init_update_libs.sh command
* Find the executable binary in build directory.
* If you want to use FONTCONFIG then you need to specify your custom fontconfig config file (e.g - "FONTCONFIG_FILE=/sdcard/fonts.conf ./ffmpeg --version", where /sdcard/fonts.conf is location of your FONTCONFIG configuration file).
* You can also download [prebuilt-binaries](https://github.com/hiteshsondhi88/ffmpeg-android/releases/latest) (Releases &gt; Downloads &gt; prebuilt-binaries[zip|tar.gz]).

License
----
  check files LICENSE.GPLv3 and LICENSE

HIRE US
--------
Get in touch with us - http://www.writingminds.com


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/hiteshsondhi88/ffmpeg-android/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

