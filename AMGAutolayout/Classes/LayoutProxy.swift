//
//  LayoutProxy.swift
//  AMGAutolayout
//
//  Created by Albert Montserrat on 24/05/2019.
//  Copyright © 2019 Albert Montserrat. All rights reserved.
//

import UIKit

public protocol AnchorContainer {
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
}

extension UIView: AnchorContainer {}
extension UILayoutGuide: AnchorContainer {}

public class LayoutProxy {
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

    private let view: UIView

    init(view: UIView) {
        self.view = view
    }

    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutAnchorProperty<A> {
        return LayoutAnchorProperty(anchor: anchor)
    }

    private func dimensionProperty<A: LayoutDimension>(with anchor: A) -> LayoutDimensionProperty<A> {
        return LayoutDimensionProperty(anchor: anchor)
    }

    public func fillSuperview(with margins: UIEdgeInsets = .zero, relativeToSafeArea: Bool = false) {
        guard let superview = view.superview else { return }
        if #available(iOS 11.0, *), relativeToSafeArea {
            top.equal(to: superview.layout.safeTop, offsetBy: margins.top)
            left.equal(to: superview.layout.safeLeft, offsetBy: margins.left)
            bottom.equal(to: superview.layout.safeBottom, offsetBy: -margins.bottom)
            right.equal(to: superview.layout.safeRight, offsetBy: -margins.right)
        } else {
            top.equal(to: superview.layout.top, offsetBy: margins.top)
            left.equal(to: superview.layout.left, offsetBy: margins.left)
            bottom.equal(to: superview.layout.bottom, offsetBy: -margins.bottom)
            right.equal(to: superview.layout.right, offsetBy: -margins.right)
        }
    }

    public func aspectRatio(_ ratio: CGFloat = 1) {
        width.equal(to: view.layout.height, multiplier: ratio)
    }

    public func center(_ otherView: UIView) {
        centerX.equal(to: otherView.layout.centerX)
        centerY.equal(to: otherView.layout.centerY)
    }

    public func centerSuperview() {
        guard let superview = view.superview else { return }
        center(superview)
    }
}

public extension UIView {
    var safeAnchorContainer: AnchorContainer {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide
        } else {
            return self
        }
    }

    var layout: LayoutProxy {
        return LayoutProxy(view: self)
    }

    func makeLayout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
}
