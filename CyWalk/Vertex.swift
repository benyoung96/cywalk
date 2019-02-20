//
//  Vertex.swift
//  testcode
//
//  Created by Travis J. Harbaugh on 10/30/16.
//  Copyright © 2016 Travis J. Harbaugh. All rights reserved.
//

import Foundation
class Vertex :NSObject{
    
    var Parent: Vertex!
    var distance: Double
    var Intersection: Intersection
    var Path_id:Int
    var heapIndex:Int

    init(parent:Vertex!,intersection:Intersection,Pathid:Int) {
        self.Parent = parent
        self.Intersection=intersection
        self.distance = Double.greatestFiniteMagnitude
        self.Path_id = Pathid
        self.heapIndex = -1
    }
    
    /// get the reference to the parent node that was visited in the
    /// shortest path alg that is used get back to the starting node.
    func setParent(parent: Vertex){
        self.Parent=parent
    }
    
    /// this sets the path ID that is associated with the path that was
    /// taken to get to the current interection. this is used to draw the
    /// path to the map so the user can see which path to take.
    func setId(Id: Int) {
        self.Path_id=Id
    }
    /// set the index where it is stored in the heap
    func setHeapIndex(heapIndex: Int) {
        self.heapIndex = heapIndex
    }
    
    /// updates the distance that is used for the shortest path alg
    func update_distance(distance: Double) {
        self.distance=distance
    }
    /// returns the distance stored in the vertex object
    func getDistance()-> Double {
        return self.distance
    }
    /// return the pathId
    func getPathId()-> Int {
        return self.Path_id
    }
    /// return the Intersection object
    func getIntersection()-> Intersection {
        return self.Intersection
    }
    /// return the Parent interection object
    func getParent()-> Vertex! {
        return self.Parent
    }
    /// return the heap index where it is stored in the heap
    func getHeapIndex()-> Int {
        return self.heapIndex
    }
    
}
