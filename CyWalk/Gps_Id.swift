//
//  Node_ids.swift
//  CyWalk
//
//  Created by Travis J. Harbaugh on 11/1/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//

import Foundation

class Gps_Id{
    var Interection_id: Int
    var Path_id: Int
    
    init(interection_id: Int, path_id: Int) {
        self.Interection_id = interection_id
        self.Path_id = path_id
    }
    
    func getInterection_id()-> Int {
        return self.Interection_id
    }
    
    func get_pathid()-> Int {
        return self.Path_id
    }
}
