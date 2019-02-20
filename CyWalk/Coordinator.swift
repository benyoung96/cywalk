//
//  Coordinator.swift
//  CyWalk
//
//  Created by Ben Young on 2/20/19.
//  Copyright © 2019 John W. Fleiner. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
