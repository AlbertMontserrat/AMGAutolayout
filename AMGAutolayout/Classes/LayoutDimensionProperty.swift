//
//  LayoutDimensionProperty.swift
//  AMGAutolayout
//
//  Created by Albert Montserrat on 24/05/2019.
//  Copyright © 2019 Albert Montserrat. All rights reserved.
//

import UIKit

public struct LayoutDimensionProperty<Anchor: LayoutDimension> {
    private let anchor: Anchor

    init(anchor: Anchor) {
        self.anchor = anchor
    }
}

public extension LayoutDimensionProperty {
    @discardableResult
    func equal(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func greaterThanOrEqual(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func lessThanOrEqual(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func equal(to otherAnchor: LayoutDimensionProperty,
               multiplier: CGFloat = 1,
               constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalTo: otherAnchor.anchor,
                          multiplier: multiplier,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func greaterThanOrEqual(to otherAnchor: LayoutDimensionProperty,
                            multiplier: CGFloat = 1,
                            constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor.anchor,
                          multiplier: multiplier,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func lessThanOrEqual(to otherAnchor: LayoutDimensionProperty,
                         multiplier: CGFloat = 1,
                         constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor.anchor,
                          multiplier: multiplier,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }
}
