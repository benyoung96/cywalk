//
//  Buildingscourtyard.swift
//  CyWalk
//
//  Created by Travis J. Harbaugh on 11/19/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//

import Foundation
import MapKit

class Buildingscourtyard: NSObject {
    
    func Cooverinnercourtyard() {
        var coordinates = [CLLocationCoordinate2D]()
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028554 , longitude: -93.651216))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028416 , longitude: -93.651215))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028416 , longitude: -93.651174))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028374 , longitude: -93.651174))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028374 , longitude: -93.650994))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028437 , longitude: -93.650995))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028438 , longitude: -93.650764))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028488 , longitude: -93.650765))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028489 , longitude: -93.650639))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.028554 , longitude: -93.650640))
        
        
        
        
        let center = CLLocationCoordinate2DMake(42.026809, 93.649847)
        let building = Building()
        building.initBuilding(buildingId: 36, center: center, coordinates: coordinates, intersection: list_of_Intersections[38], name: "Coover inner courtyard")
        buildings_courtyard.append(building)
    }
    
    func FoodSciencesBuildinginnercourtyard() {
        var coordinates = [CLLocationCoordinate2D]()
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.027004 , longitude: -93.643116))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.026727 , longitude: -93.643116))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.026727 , longitude: -93.642764))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.027004 , longitude: -93.642763))

        
        
        
        let center = CLLocationCoordinate2DMake(42.026809, 93.649847)
        let building = Building()
        building.initBuilding(buildingId: 40, center: center, coordinates: coordinates, intersection: list_of_Intersections[38], name: "Food Sciences Building inner courtyard")
       buildings_courtyard.append(building)
    }
    
    
    func ScienceHallinnercourtyard() {
        var coordinates = [CLLocationCoordinate2D]()
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029369 , longitude: -93.646485))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029288 , longitude: -93.646485))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029289 , longitude: -93.646177))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029369 , longitude: -93.646177))

        
        
        let center = CLLocationCoordinate2DMake(42.026809, 93.649847)
        let building = Building()
        building.initBuilding(buildingId: 52, center: center, coordinates: coordinates, intersection: list_of_Intersections[38], name: "Science Hall inner courtyard")
        buildings_courtyard.append(building)
    }
    
    
    func LagomarcinoHallInnerCourtyard1() {
        var coordinates = [CLLocationCoordinate2D]()
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.030185 , longitude: -93.645558))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.030074 , longitude: -93.645558))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.030074 , longitude: -93.645546))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029974 , longitude: -93.645546))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029974 , longitude: -93.645411))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029978 , longitude: -93.645411))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029979 , longitude: -93.645353))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029972 , longitude: -93.645353))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029972 , longitude: -93.645196))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.030073 , longitude: -93.645196))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.030073 , longitude: -93.645186))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.030185 , longitude: -93.645186))

        
        let center = CLLocationCoordinate2DMake(42.026809, 93.649847)
        let building = Building()
        building.initBuilding(buildingId: 54, center: center, coordinates: coordinates, intersection: list_of_Intersections[38], name: "Lagomarcino Hall Inner Courtyard1")
        buildings_courtyard.append(building)
    }
    
    
    func LagomarcinoHallInnerCourtyard2() {
        var coordinates = [CLLocationCoordinate2D]()
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029944 , longitude: -93.645522))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029764 , longitude: -93.645522))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029764 , longitude: -93.645508))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029677 , longitude: -93.645507))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029677 , longitude: -93.645520))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029498 , longitude: -93.645520))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029497 , longitude: -93.645410))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029502 , longitude: -93.645411))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029502 , longitude: -93.645350))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029498 , longitude: -93.645350))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029498 , longitude: -93.645121))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029611 , longitude: -93.645122))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029611 , longitude: -93.645161))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029660 , longitude: -93.645161))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029659 , longitude: -93.645243))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029782 , longitude: -93.645243))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029782 , longitude: -93.645160))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029828 , longitude: -93.645161))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029828 , longitude: -93.645121))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029944 , longitude: -93.645122))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029944 , longitude: -93.645351))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029938 , longitude: -93.645351))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029938 , longitude: -93.645411))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029944 , longitude: -93.645411))

        
        let center = CLLocationCoordinate2DMake(42.026809, 93.649847)
        let building = Building()
        building.initBuilding(buildingId: 54, center: center, coordinates: coordinates, intersection: list_of_Intersections[38], name: "Lagomarcino Hall Inner Courtyard2")
        buildings_courtyard.append(building)
    }
    
    func SeedScienceBuilding() {
        var coordinates = [CLLocationCoordinate2D]()
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029337 , longitude: -93.642425))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029242 , longitude: -93.642425))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029242 , longitude: -93.642273))
        coordinates.append(CLLocationCoordinate2D.init(latitude:42.029337 , longitude: -93.642273))

        
        let center = CLLocationCoordinate2DMake(42.026809, 93.649847)
        let building = Building()
        building.initBuilding(buildingId: 61, center: center, coordinates: coordinates, intersection: list_of_Intersections[38], name: "Seed Science Building inner courtyard")
        buildings_courtyard.append(building)
    }
    
}
