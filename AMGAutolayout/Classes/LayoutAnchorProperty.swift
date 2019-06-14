//
//  LayoutProperty.swift
//  AMGAutolayout
//
//  Created by Albert Montserrat on 24/05/2019.
//  Copyright © 2019 Albert Montserrat. All rights reserved.
//

import UIKit

public struct LayoutAnchorProperty<Anchor: LayoutAnchor> {
    private let anchor: Anchor

    init(anchor: Anchor) {
        self.anchor = anchor
    }
}

public extension LayoutAnchorProperty {
    @discardableResult
    func equal(to otherAnchor: LayoutAnchorProperty, offsetBy constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalTo: otherAnchor.anchor,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func greaterThanOrEqual(to otherAnchor: LayoutAnchorProperty,
                            offsetBy constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor.anchor,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func lessThanOrEqual(to otherAnchor: LayoutAnchorProperty,
                         offsetBy constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor.anchor,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }
}
