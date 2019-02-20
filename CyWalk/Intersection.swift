//
//  Intersection.swift
//  CyWalk
//
//  Created by John W. Fleiner on 10/28/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//

import Foundation
import MapKit

var list_of_Intersections = [Intersection]()

class Intersection: NSObject {
    
    var intersectionId: Int = -1
    
    /// List of Path's associated with the intersection
    var pathList: [Int]!

    var center: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    func initIntersection(intersectionId: Int, pathList: [Int], center: CLLocationCoordinate2D) {
        self.intersectionId = intersectionId
        self.pathList = pathList
        self.center = center
    }
    
    func getIntersectionId() -> Int {
        return self.intersectionId
    }
    
    func setIntersectionId(id: Int) {
        self.intersectionId = id
    }
}
