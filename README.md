# AMGAutolayout

[![CI Status](https://img.shields.io/travis/AlbertMontserrat/AMGAutolayout.svg?style=flat)](https://travis-ci.org/AlbertMontserrat/AMGAutolayout)
[![Version](https://img.shields.io/cocoapods/v/AMGAutolayout.svg?style=flat)](https://cocoapods.org/pods/AMGAutolayout)
[![License](https://img.shields.io/cocoapods/l/AMGAutolayout.svg?style=flat)](https://cocoapods.org/pods/AMGAutolayout)
[![Platform](https://img.shields.io/cocoapods/p/AMGAutolayout.svg?style=flat)](https://cocoapods.org/pods/AMGAutolayout)

## How it works

This library follows and extends the custom DSL created by John Sundell in this post:

https://www.swiftbysundell.com/posts/building-dsls-in-swift

In this library there lot of additions like:

* Working directly with dimension constants like `$0.height == 30`
* Working directly with properties and get completely rid of `view.xyzAnchor`
* Adding lofs of extension, as, for example, having the safe area with a simple `$0.top = $1.layout.safeTop`
* Allowing multiplier with custom operators and even combine multiplier with offset to do something like `$0.height = $1.layout.height * 2 + 10`
* Return the generated constraint even with the operators function to be able to handle next changes in the view controller. Also added as a `@discardableResult` to avoid warnings in regular usage
* And much more...

Those are some examples of what is possible to do with AMGAutolayout:

```
backgroundView.makeLayout {
    $0.fillSuperview(with: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), relativeToSafeArea: true)
}

//Without operators

titleLabel.makeLayout {
    topConstraint = $0.top.equal(to: backgroundView.layout.top, offsetBy: 20)
    $0.left.equal(to: backgroundView.layout.left, offsetBy: 20)
    $0.right.equal(to: backgroundView.layout.right, offsetBy: -20)
    $0.height.equal(to: 52)
}

textLabel.makeLayout {
    $0.top.equal(to: titleLabel.layout.bottom, offsetBy: 20)
    $0.centerX.equal(to: titleLabel.layout.centerX)
    $0.width.equal(to: titleLabel.layout.width, constant: 10)
    $0.height.equal(to: titleLabel.layout.height, multiplier: 2, constant: 10)
}

//With operators

secondTitleLabel.layout.top == textLabel.layout.bottom + 50
secondTitleLabel.makeLayout {
    $0.left == titleLabel.layout.left
    $0.right == titleLabel.layout.right - 30
    $0.height == 50
}

secondTextLabel.makeLayout {
    topConstraint2 = $0.top == secondTitleLabel.layout.bottom + 20
    $0.centerX == secondTitleLabel.layout.centerX
    $0.width == secondTitleLabel.layout.width - 50
    $0.height == secondTitleLabel.layout.height * 3 + 50
}

frameView.makeLayout {
    $0.top == secondTextLabel.layout.bottom + 20
    $0.left == backgroundView.layout.left + 20
    $0.right == backgroundView.layout.right - 20
    $0.aspectRatio(5)
    $0.bottom == backgroundView.layout.bottom - 20
}

frameView2.makeLayout {
    $0.centerSuperview()
    $0.width == 50
    $0.height == 20
}

frameView3.makeLayout {
    $0.center(frameView2)
    $0.width == 50
    $0.height == 20
}
```

The `view.layout` variable have all this properties: 

```
public lazy var leading = property(with: view.leadingAnchor)
public lazy var trailing = property(with: view.trailingAnchor)
public lazy var left = property(with: view.leftAnchor)
public lazy var right = property(with: view.rightAnchor)
public lazy var top = property(with: view.topAnchor)
public lazy var bottom = property(with: view.bottomAnchor)
public lazy var width = dimensionProperty(with: view.widthAnchor)
public lazy var height = dimensionProperty(with: view.heightAnchor)
public lazy var centerX = property(with: view.centerXAnchor)
public lazy var centerY = property(with: view.centerYAnchor)

//Safe area
public lazy var safeTop = property(with: view.safeAnchorContainer.topAnchor)
public lazy var safeBottom = property(with: view.safeAnchorContainer.bottomAnchor)
public lazy var safeLeft = property(with: view.safeAnchorContainer.leftAnchor)
public lazy var safeRight = property(with: view.safeAnchorContainer.rightAnchor)
public lazy var safeLeading = property(with: view.safeAnchorContainer.leadingAnchor)
public lazy var safeTrailing = property(with: view.safeAnchorContainer.trailingAnchor)
public lazy var safeWidth = dimensionProperty(with: view.safeAnchorContainer.widthAnchor)
public lazy var safeHeight = dimensionProperty(with: view.safeAnchorContainer.heightAnchor)
public lazy var safeCenterX = property(with: view.safeAnchorContainer.centerXAnchor)
public lazy var safeCenterY = property(with: view.safeAnchorContainer.centerYAnchor)
```

All this properties are available:

```
var leadingAnchor: NSLayoutXAxisAnchor { get }
var trailingAnchor: NSLayoutXAxisAnchor { get }
var leftAnchor: NSLayoutXAxisAnchor { get }
var rightAnchor: NSLayoutXAxisAnchor { get }
var topAnchor: NSLayoutYAxisAnchor { get }
var bottomAnchor: NSLayoutYAxisAnchor { get }
var widthAnchor: NSLayoutDimension { get }
var heightAnchor: NSLayoutDimension { get }
var centerXAnchor: NSLayoutXAxisAnchor { get }
var centerYAnchor: NSLayoutYAxisAnchor { get }
````

The operators that can be used are:

* property1 `==` property2
* property1 `>=` property2 
* property1 `>=` property2

* dimensionProperty1 `==` dimensionProperty2
* dimensionProperty1 `>=` dimensionProperty2 
* dimensionProperty1 `>=` dimensionProperty2
* dimensionProperty1 `==` constant
* dimensionProperty1 `>=` constant 
* dimensionProperty1 `>=` constant

And for the part of `property2`  you can also do:

* property2 `+` constant
* property2 `-` constant

And for the part of `dimensionProperty2`:

* dimensionProperty2 `*` multiplier
* dimensionProperty2 `*` multiplier `+` constant
* dimensionProperty2 `*` multiplier `-` constant


## Requirements

iOS 9.0 is required

## Installation

AMGAutolayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AMGAutolayout'
```

## Author

AlbertMontserrat, albert.montserrat.gambus@gmail.com

## License

AMGAutolayout is available under the MIT license. See the LICENSE file for more info.
