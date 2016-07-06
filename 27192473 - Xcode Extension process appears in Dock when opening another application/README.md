
#### Product
Developer Tools

#### Classification
Other Bug

#### Reproducibility
Always

#### Title
Xcode Extension process appears in Dock when opening another application

#### Description
Xcode Editor Extensions can be programmed to open other applications, but when they do their process appears in the OSX Dock as the .appex bundle, and bounces for a few minutes before going away, presumably at the same time as the extension process is exited or terminated by Xcode.

The method of opening another application used in the sample is:

NSWorkspace.shared().launchApplication("TextEdit")

#### Steps to reproduce
1. Install an Xcode Editor Extension that opens other apps
2. Perform the extension command that will open an app

#### Expected Results
The extension opens an app, and the app appears in the Dock.

#### Actual Results
The extension opens an app, and the extension appears in the Dock and bounces, the app also appears in the Dock.

#### Xcode Version/Build & OSX Version/Build

OS X El Capitan Version 10.11.5 (15F34)
Xcode Version 8.0 beta 2 (8S162m)

Also occurred on:

OS X El Capitan Version 10.11.5 (15F34)
Xcode Version 8.0 beta 1
