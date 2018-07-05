<p align="center">
<img src="https://github.com/IHEARTCOOKIES/FBLeakDetectorVC/blob/master/logo.png" alt="FBLeakDetectorVC"/>
</p>

[![CI Status](https://img.shields.io/travis/IHEARTCOOKIES/FBLeakDetectorVC.svg?style=flat)](https://travis-ci.org/IHEARTCOOKIES/FBLeakDetectorVC)
[![Version](https://img.shields.io/cocoapods/v/FBLeakDetectorVC.svg?style=flat)](https://cocoapods.org/pods/FBLeakDetectorVC)
[![License](https://img.shields.io/cocoapods/l/FBLeakDetectorVC.svg?style=flat)](https://cocoapods.org/pods/FBLeakDetectorVC)
[![Platform](https://img.shields.io/cocoapods/p/FBLeakDetectorVC.svg?style=flat)](https://cocoapods.org/pods/FBLeakDetectorVC)

FBLeakDetector is a straightforward and effective leak detector used for finding lingering view controllers that appeared to be released out of memory.

## Requirements

FBLeakDetector is compatible with iOS 8.0+ and requires ARC to build.

## Installation

FBLeakDetectorVC is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FBLeakDetectorVC'
```

## Usage

Start by simply subclassing the UIViewController(s) that you'd like to monitor for potential leakage. A common practice is to let your BaseViewController subclass our FBLeakDetectorViewController. By doing so, you'll have a leak detector enabled for all view controllers that inherits your BaseViewController.

Switch between the action types by overriding the getter as follows:

```objective-c
@implementation BaseViewController

#pragma mark - Leak Detection Action Type
- (FBLeakDetectorActionType)leakDetectorActionType {
  return FBLeakDetectorActionTypeException;
}

@end
```

## License

FBLeakDetectorVC is available under the MIT license. See the LICENSE file for more info.
