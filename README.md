# SHNDTransition

[![CI Status](https://img.shields.io/travis/sahandraeisi1994@gmail.com/SHNDTransition.svg?style=flat)](https://travis-ci.org/sahandraeisi1994@gmail.com/SHNDTransition)
[![Version](https://img.shields.io/cocoapods/v/SHNDTransition.svg?style=flat)](https://cocoapods.org/pods/SHNDTransition)
[![License](https://img.shields.io/cocoapods/l/SHNDTransition.svg?style=flat)](https://cocoapods.org/pods/SHNDTransition)
[![Platform](https://img.shields.io/cocoapods/p/SHNDTransition.svg?style=flat)](https://cocoapods.org/pods/SHNDTransition)

<img src="https://raw.githubusercontent.com/Carthage/Carthage/master/Logo/PNG/colored.png" width="32px" height="32px" />  <img src="https://raw.githubusercontent.com/CocoaPods/shared_resources/master/img/CocoaPods-Logo-Highlight.png" width="128px" height="32px" />

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

actually is easy as blink breathing 

first of all you create a instance of SHNDTransitionController in your first UIViewController class 👇🏻

```Swift

let transitionDelegate = SHNDTransitionController(animationDuration: 0.5,
                                                  presentTransitionMode: .downToUp,
                                                  dismissTransitionMode: .leftToRight)

```

presentTransitionMode and dismissTransitionMode are just a simple Enum that represent Mode of your transition animation.

and final step happens in your ```func prepare(for segue: UIStoryboardSegue, sender: Any?) ``` like this

```Swift

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination
    destination.transitioningDelegate = transitionDelegate
}

```

now in your Second UIViewController class you just should dismiss the ViewController, in here i dismissed it with an UIButton you can dismiss it with anything you want

```Swift

@IBAction func dismissVC(_ sender: Any) {
    self.dismiss(animated: true)
}

```

## Requirements
Swift 4 or Later
## Installation

SHNDTransition is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SHNDTransition'
```

## Author

sahandraeisi1994@gmail.com, sahandraeisi@yahoo.com

## License

SHNDTransition is available under the MIT license. See the LICENSE file for more info.
