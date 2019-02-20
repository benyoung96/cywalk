//
//  BinaryHeap.swift
//  CyWalk
//
//  Created by Travis J. Harbaugh on 10/29/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//

import Foundation
class BinaryHeap: NSObject{
    
    var Binarray: [Binnode]
    var size:  Int
    override init() {
        self.Binarray = [Binnode]()
        self.size=0
    }
    
    /// Compares two nodes distance
    ///
    /// - Parameters:
    ///   - first: first node
    ///   - second: second node
    /// - Returns: returns -,0,+
    func compare(first:Int, second:Int)-> Double {
        return self.Binarray[first].getvertex().getDistance() - self.Binarray[second].getvertex().getDistance()
    }
    
    /// This method will bubble up elements from the given index and
    /// swap its child with its parent if parent > child until it satifies the heap
    /// order property
    ///
    /// - Parameter index: heap index
    func Percolate_up(index:Int){
        var child:Int = index
        var parent : Int = (child-1)/2
        var temp:Binnode
        while ((child != 0) && (child < self.size) && (compare(first: Int(child),second: Int(parent))<0) ){
            // swap the parent and child position in the array
            temp = self.Binarray[child]
            self.Binarray[child] = self.Binarray[parent]
            self.Binarray[parent] = temp
            
            // swap the index of both the parent and child
            self.Binarray[child].set_index(ind: child)
            self.Binarray[child].getvertex().setHeapIndex(heapIndex: child)
            self.Binarray[parent].set_index(ind: parent)
            self.Binarray[parent].getvertex().setHeapIndex(heapIndex: parent)
            
            // child becomes the parent position and recalulate the new parent position
            child = parent
            parent = (child - 1)/2
        }
  
    }
    
    /// This method will bubble down elemnts from the beginning of the heap at
    /// a given index and swap the parent with one of its child until satisfy the heap
    /// order property
    ///
    /// - Parameter index: heap index
    func percolate_down(index:Int){
        var child:Int = (2 * index) + 1
        var parent = index
        while (child < self.size) {
            
            // compare the two children and see which one needs to be swap
            if (child + 1 < self.size) && self.compare(first: child,second: child + 1) > 0 {
                child = child + 1
            }
            
            if self.compare(first: parent, second: child) > 0 {
                // swap the parent and the child
                let temp:Binnode = self.Binarray[parent]
                self.Binarray[parent] = self.Binarray[child]
                self.Binarray[child] = temp
                
                // set the parent and child new position in the array
                self.Binarray[parent].set_index(ind: parent)
                self.Binarray[parent].getvertex().setHeapIndex(heapIndex: parent)
                self.Binarray[child].set_index(ind: child)
                self.Binarray[child].getvertex().setHeapIndex(heapIndex: child)
            }
            
            parent = child
            child = (2 * parent) + 1
        }
    }
    
    /// This method will insert a vertex in the Bineary Heap
    ///
    /// - Parameter V_node: node to insert
    func insert_node(V_node:Vertex) {
        let node = Binnode.init(vertex: V_node,index: self.size)
        node.getvertex().setHeapIndex(heapIndex: self.size)
        Binarray.append(node)
        self.size=self.size+1;
        self.Percolate_up(index: self.size - 1)
    }
    
    /// This method will extract the next priority element on the queue and return
    /// vertex object to the user
    ///
    /// - Returns: binary heap node to be returned
    func remove_min()-> Binnode? {
        if(self.size==0){
            return nil;
        }else{
            let temp: Binnode = self.Binarray[0]
            // set the index to -1 because it is no longer in the heap
            temp.set_index(ind: -1)
            temp.getvertex().setHeapIndex(heapIndex: -1)
            // take the last item in the heap to the front then remove it
            self.Binarray[0] = self.Binarray[self.size-1]
            self.Binarray.remove(at: self.size-1)
            self.size = self.size - 1
            self.percolate_down(index: 0)
            return temp
        }
    }
    
    /// This method will return the minimum item on the heap
    /// returns nil or Vertex object
    ///
    /// - Returns: return nil if empty or vertex
    func peek_min()-> Binnode? {
        if(self.size==0){
            return nil;
        }else{
            return self.Binarray[0];
        }
    }
    
    /// This will take the distance that was just updated and
    /// will fix the binheap property
    ///
    /// - Parameter locate: location to decrease
    func  decrease_key(locate:Int) {
        self.Percolate_up(index:locate)
    }
    
    /// This method will infro mthe user if the heap has no
    /// elements in the heap
    ///
    /// - Returns: is the heap is empty or not
    func is_empty()-> Bool {
        return Binarray.isEmpty;
    }
}
