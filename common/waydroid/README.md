# WayDroid

## Installation
```
sudo waydroid init -s GAPPS -f
waydroid session start
sudo waydroid shell
```
Inside the shell run this command:
```
ANDROID_RUNTIME_ROOT=/apex/com.android.runtime ANDROID_DATA=/data ANDROID_TZDATA_ROOT=/apex/com.android.tzdata ANDROID_I18N_ROOT=/apex/com.android.i18n sqlite3 /data/data/com.google.android.gsf/databases/gservices.db "select * from main where name = \"android_id\";"
```
Use the string of numbers printed by the command to register the device on your Google Account at
[https://www.google.com/android/uncertified](https://www.google.com/android/uncertified)

## Usage
```
waydroid show-full-ui
```
