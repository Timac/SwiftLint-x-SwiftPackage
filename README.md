# SucceedsPostAction.sh

`SucceedsPostAction.sh` is a bash script to be used as a 'Succeeds' post action in Xcode. This convenient script will automatically trigger [SwiftLint](https://realm.github.io/SwiftLint/) when you compile a Swift Package.


## Why?

At the moment you can't easily trigger SwiftLint when compiling a Swift Package. Swift 5.6 (not yet available at this time) might help thanks to [SE-0303: Package Manager Extensible Build Tools](https://github.com/apple/swift-evolution/blob/main/proposals/0303-swiftpm-extensible-build-tools.md). This script can be used in the meantime to help develop your Swift packages.


## Requirements

- Xcode 13.0 or later
- [SwiftLint](https://realm.github.io/SwiftLint/) installed at `/usr/local/bin/swiftlint`


## Installation

1. Download the script [SucceedsPostAction.sh](SucceedsPostAction.sh) on your Mac.
2. Ensure that the script has the proper permissions, i.e. run `chmod 755 SucceedsPostAction.sh`.
3. If you want to use custom SwiftLint rules, add the `.swiftlint.yml` file next to the script.
4. Launch Xcode 13.0 or later
5. Open Preferences > Behaviors > Succeeds
6. Choose the script `SucceedsPostAction.sh`

![](Installation.png)

That's it: each time you compile a Swift Package, the `SucceedsPostAction.sh` will run SwiftLint.


## Demo

![](video.mov)


## Limitations

A post action script running in Xcode can't add a log, a warning or an error to the Xcode build results. As a consequence, `SucceedsPostAction.sh` opens a text file as a new window in Xcode with the list of SwiftLint reports. There is no deep integration to easily jump to the SwiftLint warnings. Once [SE-0303: Package Manager Extensible Build Tools](https://github.com/apple/swift-evolution/blob/main/proposals/0303-swiftpm-extensible-build-tools.md) is integrated, this script shouldn't be needed anymore.


## Looking for a job?

Eimy is looking for SwiftUI experts to grow our truly usable consumer products team:

❤️ SwiftUI
🤓 State-of-the-art apps
✨ Innovative consumer products
🛠 Experienced team
📍 Munich, Germany

👉 [https://www.geteimy.com/jobs](https://www.geteimy.com/jobs) 


