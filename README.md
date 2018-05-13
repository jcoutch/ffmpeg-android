FFmpeg-Android
==============

This repo updates the work done in [WritingMinds/ffmpeg-android](https://github.com/WritingMinds/ffmpeg-android) to work with newer versions of FFmpeg.  Primary focus will be armv7-neon, since I have a project that requires it.

* FFmpeg for Android compiled with x264, libass, fontconfig, freetype and fribidi
* All libraries are pulled down as git submodules or from svn (as is the case for Lame)
* FFmpeg can be optionally compiled with libnewtek_ndi (output support only on ARM)
* Supports Android L

Supported Architecture
----
* armv7-neon
* armv7 (currently disabled in build)
* x86 (currently disabled in build)

Instructions
----
The build process has been tested on Ubuntu 18.04, but should work for other distributions.

* Set the following environment variables (`NEWTEK_NDI_SDK` is optional):
```bash
export ANDROID_NDK={Android NDK Base Path}
export NEWTEK_NDI_SDK={Newtek NDI Linux SDK Base Path}
```
* Run the following commands to compile FFmpeg:
```bash
sudo apt-get --quiet --yes install build-essential git subversion autoconf libtool pkg-config gperf gettext yasm python-lxml docbook2x
./init_update_libs.sh
./android_build.sh
```

* To pull down the latest versions of all libraries, you can run the following commands:
```bash
git submodule update --recursive --remote
svn up lame-svn
```
* The only module that

* Find the executable binary in `build` directory.
* If you want to use FONTCONFIG then you need to specify your custom fontconfig config file (e.g - "FONTCONFIG_FILE=/sdcard/fonts.conf ./ffmpeg --version", where /sdcard/fonts.conf is location of your FONTCONFIG configuration file).

License
----
  check files LICENSE.GPLv3 and LICENSE
