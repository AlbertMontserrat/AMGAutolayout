//
//  LayoutDimension.swift
//  AMGAutolayout
//
//  Created by Albert Montserrat on 24/05/2019.
//  Copyright © 2019 Albert Montserrat. All rights reserved.
//

import UIKit

public protocol LayoutDimension {
    func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint

    func constraint(equalTo anchor: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutDimension: LayoutDimension {}
