//
//  Task.swift
//  TodoMaster2
//

import Foundation

// Defines structure of each task

struct Task {
    
    let name: String // Task name
    let priority: Int // Task priority (1-10) with 1 being highest priority
    let timeEstimate: Double // Task estimated time of completition (ETC) in hours
    
    // Getter methods
    
    func getName() -> String {
        return self.name
    }
    
    func getPriority() -> Int {
        return self.priority
    }
    
    func getTime() -> Double {
        return self.timeEstimate
    }
    
}
