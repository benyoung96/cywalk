//
//  Binheap.swift
//  CyWalk
//
//  Created by Travis J. Harbaugh on 10/28/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//

import Foundation

class Binnode:NSObject{
    var vertex: Vertex // stores Vertex NSObject
    var index: Int //stores an index where it is at in the heap
    
    init(vertex: Vertex,index: Int) {
        self.vertex=vertex
        self.index=index
    }
    
    /// set the new index where the node is in the binary heap
    func set_index(ind:Int) {
        self.index = ind
    }
    
    /// return an vertex NSObject
    func getvertex()-> Vertex {
        return self.vertex
    }

    /// Return the current index where it is storedin the heap that
    /// will be used for heap property
    ///
    /// - Returns: index
    func getindex()-> Int {
        return self.index
    }
    
}
