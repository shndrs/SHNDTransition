# SHNDTransition

![swift-version](https://img.shields.io/badge/Swift-4-43bc59.svg)
[![Version](https://img.shields.io/cocoapods/v/SHNDTransition.svg?style=flat)](https://cocoapods.org/pods/SHNDTransition)
[![License](https://img.shields.io/cocoapods/l/SHNDTransition.svg?style=flat)](https://cocoapods.org/pods/SHNDTransition)
[![Platform](https://img.shields.io/cocoapods/p/SHNDTransition.svg?style=flat)](https://cocoapods.org/pods/SHNDTransition)

<img src="https://raw.githubusercontent.com/CocoaPods/shared_resources/master/img/CocoaPods-Logo-Highlight.png" width="128px" height="32px" />

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

If you're a **SEGUE** fan then you going to like this as HELL!!! 😃
Actually it is easy as breathing 
### Step 1
Set your segue Kind to ```Show Detail```.

![step 1](https://user-images.githubusercontent.com/34839080/51232090-f2b28100-197a-11e9-9c18-1988178cf0f4.png)

### Step 2
Create an instance of  ```SHNDTransitionController``` in your FirstViewController class 👇🏻

```Swift

let transitionDelegate = SHNDTransitionController(animationDuration: 0.5,
                                                  presentTransitionMode: .downToUp,
                                                  dismissTransitionMode: .leftToRight)

```

```presentTransitionMode``` and ```dismissTransitionMode``` are just two simple enums that represent mode of your transition animation.

### Step 3

This step happens in your ```func prepare(for segue: UIStoryboardSegue, sender: Any?) ``` like this 👇🏻

```Swift

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    guard let destination = segue.destination as? SecondViewController else { return }
    destination.transitioningDelegate = self.transitionDelegate
}

```
### Step 4

In your SecondViewController class, you should just dismiss the UIViewController, in here i dismissed it with an UIButton, you can dismiss it with anything you want

```Swift

@IBAction func dismissVC(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
}

```
and do whatever you want in completion handler closure. In this case i just used ```nil```
## Requirements

<p>iOS 9.0+</p>
<p>Xcode 10.1</p>  
<p>Swift 4.0 or later</p>

## Installation

SHNDTransition is available through [CocoaPods](https://cocoapods.org/pods/SHNDTransition). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SHNDTransition', '~> 0.1.2'
```

## Author

sahandraeisi1994@gmail.com, sahandraeisi@yahoo.com

## License

SHNDTransition is available under the MIT license. See the LICENSE file for more info.
