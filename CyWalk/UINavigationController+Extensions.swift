//
//  UINavigationController+Extensions.swift
//  CyWalk
//
//  Created by Ben Young on 2/20/19.
//  Copyright © 2019 John W. Fleiner. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func style() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .mainColor
        navigationBar.tintColor = .white
    }
}
