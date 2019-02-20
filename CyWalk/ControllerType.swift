//
//  ControllerType.swift
//  CyWalk
//
//  Created by Ben Young on 2/20/19.
//  Copyright © 2019 John W. Fleiner. All rights reserved.
//

import UIKit

protocol ControllerType {
    
    /// Factory function for view controller instatiation
    ///
    /// - Returns: View controller of concrete type
    static func create() -> UIViewController
}
