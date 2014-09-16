<img src="https://dl.dropboxusercontent.com/u/7817937/_github/logo.png" width="500px" alt="AQSPermissionsLib" />

![](http://img.shields.io/cocoapods/v/AQSPermissionsLib.svg?style=flat)

Handle permission concerns without headache!

<img src="https://dl.dropboxusercontent.com/u/7817937/_github/AQSPermissionsLib/PhotoLibrary.png" width="42px" valign="bottom" /> Photo Library
---

Just do as following to ask the permission to access to the Photo Library,

```objc
[AQSPermissions askPhotoLibraryPermissionWithBlock:^(BOOL permission) {
	if (permission) {
		NSLog(@"Yay! The permission has granted.");
	} else {
		NSLog(@"You could not get the permission.");
	}
}];
```

<img src="https://raw.githubusercontent.com/AquaSupport/AQSPermissionsLib/master/SS_1.png" width="240px" />

`- askPhotoLibraryPermissionWithBlock:` does not do any work if the permission is already granted / declined (just call the block with current permission.), so you do not need to check if the permission is already checked before calling this method.

The following code works nice.

```objc
// XXPrePermissionViewController.m

// In view, show a button and some tutorial.

- (IBAction)didPushAskPermissionButton:(id)sender {
    [AQSPermissions askPhotoLibraryPermissionWithBlock:^(BOOL permission) {
        if (permission) {
            // Go to the main view.
        } else {
            // Show some help to turn on the permission.
        }
    }];
}
```

This code works as following.

1. If a user runs the app at first
  1. Show the view.
  2. (the user taps the button.)
  3. iOS asks the permission
  4. -> Show main view if the permission granted.
  5. -> Show helps if the permission declined.
2. The user has run the app already.
  1. -> Show main view if the permission granted.
  2. -> Show helps if the permission declined.

Or if you just check whether the access has granted (with no blocks),

```objc
BOOL permission = [AQSPermissions checkPhotoLibraryPermission];
```

Keep in mind `- checkPhotoLibraryPermission` returns `NO` if you have not ask the permission.

Installation
---

`pod 'AQSPermissionsLib'`

and import `AQSPermissions.h` to start using!

Some Trivia
---

### Add an usage description

You can add an usage description to the permission asking, like following

<img src="https://raw.githubusercontent.com/AquaSupport/AQSPermissionsLib/master/SS_2.png" width="240px" />

To do that, simply add key: `NSPhotoLibraryUsageDescription` with string value to the `<appname>-Info.plist`. To localize, edit `InfoPlist.strings` as following.

It might improve the approval rate.

```
NSCameraUsageDescription = "I want to access your photos.";
```

### Want to be asked the permission many times for testing.

Just change your App's Bundle Identifier like `org.openaquamarine.PermissionsLib` to `org.openaquamarix.PermissionsLib`.

iOS will recognize them as different apps.

#### Reference

- [Cocoa Keys](https://developer.apple.com/library/ios/documentation/general/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html)

LICENSE
---

The MIT License (MIT)

Copyright (c) 2014 AquaSupport

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


