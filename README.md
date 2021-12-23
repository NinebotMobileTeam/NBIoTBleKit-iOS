# NBIoTBleKit

[![CocoaPods compatible](https://img.shields.io/cocoapods/v/NBIoTBleKit.svg)](https://cocoapods.org/pods/NBIoTBleKit)

The NBIoTBleKit SDK allows you to build your own APP for controlling Segway vehicles via Bluetooth quickly.


## Features for 1.1.0

- [x] Add helmet lock's unlock commands
- [x] Add helmet information query function

## Simples

We have provided one sample projects in the repository. To use it download the repo and open NBIoTBle.xcworkspace. You'll see two schemes: NBIoTBleKitDemo and NBIoTBleKitDemoSwift - select NBIoTBleKitDemoSwift, fill your platform code and secret in Appdeleagate.swift and then build & run! Source files for these are in the Examples directory in project navigator. Have fun!

## Installation

### CocoaPods

For NBIoTBleKit, use the following entry in your Podfile:

```rb
pod 'NBIoTBleKit', '~> 1.1.0'
```

Then run `pod install`.

In any file you'd like to use NBIoTBleKit in, don't forget to
import the framework with `import NBIoTBleKit`.


If you're trying update, use `pod update` instead `pod install`

### Manually

Drag NBIoTBleKit.framework and add to your project.

