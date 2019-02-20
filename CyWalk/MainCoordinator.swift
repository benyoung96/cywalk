//
//  MainCoordinator.swift
//  CyWalk
//
//  Created by Ben Young on 2/20/19.
//  Copyright © 2019 John W. Fleiner. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        navigationController.style()
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = GoogleMapsViewController.create() as! GoogleMapsViewController
        vc.navigationItem.title = "Map"
        vc.navigationController?.navigationBar.barTintColor = .mainColor
        navigationController.pushViewController(vc, animated: false)
    }
}
