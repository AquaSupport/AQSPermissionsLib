AQSPermissionsLib
=================

Handle permission concerns without headache!

Camera Roll
---

Just do as following to ask the permission to access to the camera roll,

```objc
[AQSPermissions askCameraRollPermissionWithBlock:^(BOOL permission) {
	if (permission) {
		NSLog(@"Yay! The permission has granted.");
	} else {
		NSLog(@"You could not get the permission.");
	}
}];
```

After that, you can use same code to check the permission. 

Or if you just check whether the access has granted (with no blocks),

```objc
BOOL permission = [AQSPermissions checkCameraRollPermission];
```

Keep in mind `- checkCameraRollPermission` returns `NO` if you have not ask the permission.

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


