# com.cancian.uservoice
uservoice for ios/android phonegap plugin

Forked from projects:
https://github.com/elvismercado/com.cancian.uservoice
https://github.com/cancian/com.cancian.uservoice

## Android platform
To install in Android, you will need to add the UserVoice SDK as decribed here:  [Android UserVoiceSDK](https://github.com/uservoice/uservoice-android-sdk).

##### To customise the UserVoice theme, check the following example:

res/values/styles.xml:
``` xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="UserVoiceTheme" parent="Theme.AppCompat.Light.DarkActionBar">
        <!-- theme customizations -->
        <item name="android:actionBarStyle">@style/AppCursosActionBar</item>
        <item name="android:colorPrimaryDark">@color/actionbar_background</item>
        <item name="android:actionMenuTextColor">@color/actionbar_text</item>

        <!-- Support library compatibility -->
        <item name="actionBarStyle">@style/AppCursosActionBar</item>

        <item name="actionMenuTextColor">@color/actionbar_text</item>


    </style>

    <!-- ActionBar styles -->
    <style name="AppCursosActionBar"
        parent="@style/Widget.AppCompat.Light.ActionBar.Solid">
        <item name="android:background">@color/actionbar_background</item>

        <!-- Support library compatibility -->
        <item name="background">@color/actionbar_background</item>
        
    </style>
</resources>
```

res/values/colors.xml:
``` xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="actionbar_background">#0073cf</color>
    <color name="actionbar_text">#ffffff</color>
</resources>
```
## iOS platform
This plugin includes the iOS UserVoiceSDK-3.2.3.

##### To customise the UserVoice theme, change the lines in UserVoiceCommand.m

``` objective-C
    [UVStyleSheet instance].navigationBarBackgroundColor = [UIColor colorWithRed:0 green:0.451 blue:0.812 alpha:1];
    [UVStyleSheet instance].preferredStatusBarStyle = UIStatusBarStyleBlackOpaque;
    [UVStyleSheet instance].navigationBarTintColor = [UIColor whiteColor];
    [UVStyleSheet instance].navigationBarTextColor = [UIColor whiteColor];
```
