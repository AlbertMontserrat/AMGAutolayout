//
//  ViewController.swift
//  AMGAutolayout
//
//  Created by AlbertMontserrat on 06/14/2019.
//  Copyright (c) 2019 AlbertMontserrat. All rights reserved.
//

import UIKit
import AMGAutolayout

class ViewController: UIViewController {

    var topConstraint: NSLayoutConstraint?
    var topConstraint2: NSLayoutConstraint?
    
    private lazy var backgroundView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        let widthFixerView = UIView()
        view.addSubview(widthFixerView)
        widthFixerView.makeLayout {
            $0.height == 0
            $0.width == view.layout.width
            $0.top == view.layout.top
            $0.left == view.layout.left
            $0.right == view.layout.right
        }
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .red
        lbl.text = "Test"
        return lbl
    }()
    
    private lazy var textLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .green
        lbl.text = "Description"
        return lbl
    }()
    
    private lazy var secondTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .red
        lbl.text = "Test"
        return lbl
    }()
    
    private lazy var secondTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .green
        lbl.text = "Description"
        return lbl
    }()
    
    private lazy var frameView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        [backgroundView].forEach { view.addSubview($0) }
        [titleLabel, textLabel, secondTitleLabel, secondTextLabel, frameView]
            .forEach { backgroundView.addSubview($0) }
        
        backgroundView.makeLayout {
            $0.fillSuperview(with: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), relativeToSafeArea: true)
        }
        
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.topConstraint?.constant = 50
            self?.topConstraint2?.constant = 50
            UIView.animate(withDuration: 1.0, animations: {
                self?.view.layoutIfNeeded()
            })
        }
    }

}

