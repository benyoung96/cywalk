//
//  Building.swift
//  CyWalk
//
//  Created by John W. Fleiner on 11/1/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//

import Foundation
import MapKit

var list_of_buildings: [Building] = []
var buildings_courtyard: [Building] = []

class Building: NSObject {
    
    var name: String = ""
    
    var buildingId = -1
    
    var center = CLLocationCoordinate2D()
    
    var coordinates: [CLLocationCoordinate2D] = []

    var intersection = Intersection()
    
    func initBuilding(buildingId: Int, center: CLLocationCoordinate2D, coordinates: [CLLocationCoordinate2D], intersection: Intersection, name: String) {
        self.buildingId = buildingId
        self.center = center
        self.coordinates = coordinates
        self.intersection = intersection
        self.name = name
    }
}
