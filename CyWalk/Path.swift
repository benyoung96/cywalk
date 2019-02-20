//
//  Path.swift
//  CyWalk
//
//  Created by John W. Fleiner on 10/28/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//

import Foundation
import MapKit

var list_of_paths = [Path]()

class Path: NSObject {
    
    /// Unique id for each sidewalk or path
    var id: Int = -1;
    
    /// length between intersections: Units = meters
    var length: Double = 0;
    
    /// List of coordinates to draw path
    var coordinates: [CLLocationCoordinate2D] = []
    
    var intersections: [Int] = []
    
    func initPath(id: Int, length: Double, coordinates: [CLLocationCoordinate2D], intersections: [Int]) {
        self.id = id
        self.length = length
        self.coordinates = coordinates
        self.intersections = intersections
    }
}
