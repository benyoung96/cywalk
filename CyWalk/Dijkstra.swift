//
//  Dijkstra.swift
//  testcode
//
//  Created by Travis J. Harbaugh on 10/30/16.
//  Copyright © 2016 Travis J. Harbaugh. All rights reserved.
//

import Foundation

class Dijkstra{
    
    init() {
        //does nothing
    }
    
    func update_neighbor(neigh1: Vertex, neigh2: Vertex, path_length: Double, path_id: Int, heap: BinaryHeap) {
        if path_length+neigh1.getDistance()<neigh2.getDistance() {
            /*update the new shortest distance */
            neigh2.update_distance(distance: path_length+neigh1.getDistance())
            /* update the path id that was taken to vist that vertex. */
            neigh2.setId(Id: path_id)
            /*set the parent pointer to point back to the cell that visited it */
            neigh2.setParent(parent: neigh1)
            if neigh2.getHeapIndex() != -1 {
                // need to call heap
                heap.decrease_key(locate: neigh2.getHeapIndex())
            }
        }
    }
    
    func dijkstra_algorithm(s_location: Intersection, end_location: Intersection, array: [Intersection])-> [Gps_Id] {
       
        /*create a heap to store nodes,lookup table*/
        let heap = BinaryHeap.init()
        var lookup_table = [Intersection:Vertex]()
       // var pathes = [Int]()
         var Gps_path = [Gps_Id]()
        /*reference to the current node from the heap */
        var current: Binnode
        var starting_vertex:Vertex
        var current_vertex:Vertex!
        
        /*set distance each vertex to infinity put it into the
         * priorty queue and store it in the lookup table */
        for intersect in array {
            let vertex = Vertex.init(parent: nil, intersection: intersect, Pathid: -1)
            heap.insert_node(V_node: vertex)
            lookup_table[intersect] = vertex
        }
        
        // set the starting vertex to zero and decrese key to the front of the queue
        starting_vertex = lookup_table[s_location]!
        starting_vertex.update_distance(distance: 0)
        starting_vertex.setId(Id: -1)
        heap.decrease_key(locate: starting_vertex.getHeapIndex())
        
        /*compute dijkstra's algorithm */
        while !heap.is_empty() {
            current = heap.remove_min()!
            /*visit all of current neighbors that a interaction is associated with */
            let paths = current.getvertex().getIntersection().pathList
            /* */
            for pathId in paths! {
                
                let path = list_of_paths[pathId]
                
                /* vist the interection that the path is associated with by checking to make sure that the intersection is not the one */
                if !path.intersections.isEmpty && list_of_Intersections[path.intersections[0]] != current.getvertex().getIntersection(){
                    self.update_neighbor(neigh1: current.getvertex(), neigh2: lookup_table[list_of_Intersections[path.intersections[0]]]!,path_length: path.length,path_id: path.id, heap: heap)
                }else {
                    if !path.intersections.isEmpty {
                        self.update_neighbor(neigh1: current.getvertex(), neigh2: lookup_table[list_of_Intersections[path.intersections[1]]]!, path_length: path.length,path_id: path.id, heap: heap)
                    }
                }
            } // end of for loop for pathid
        }
        
        /*find the end point vertex */
        current_vertex = lookup_table[end_location]!
        
        while current_vertex != nil && current_vertex.getParent() != nil {
            let gps_id = Gps_Id.init(interection_id: current_vertex.getIntersection().getIntersectionId(), path_id: current_vertex.getPathId())
            Gps_path.append(gps_id)
            print("Path: \(current_vertex.getPathId())")
            print("inter: \(current_vertex.getIntersection().getIntersectionId())")
           // pathes.append(current_vertex.Path_id)
            current_vertex = current_vertex!.getParent()
        }
        return Gps_path
    }
}
