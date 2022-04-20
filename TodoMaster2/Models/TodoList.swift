//
//  TodoList.swift
//  TodoMaster2
//

import Foundation

// TodoList struct
//  - Organizes tasks in a list
//  - Keeps track of number of taks
//  - Calculates estimated completion time
//  - Sorts list based on filter

struct TodoList {
    
    // Main list that manages complexity
    var taskList: [Task] = []
    
    // Returns number of tasks in taskList
    func getNumTasks() -> Int {
        return taskList.count
    }
    
    // Adds task to taskList
    mutating func addTask(task: Task) {
        self.taskList.append(task)
    }
    
    // Bubble sort algorithm that sorts list based on filter
    mutating func sortTasksWithFilter(filter: String) {
        let numTasks = self.taskList.count
        
        // Keeping track of number of tasks already sorted
        // to avoid unnecessary iterations
        let sortedCount = 0
        
        // Each loop, the function moves the task with the
        // lowest priority / high ETC to the end
        for _ in stride(from: 0, to: numTasks, by: 1) {
            
            for i in stride(from: 0, to: (numTasks - (sortedCount + 1)), by: 1) {
                
                if filter == "priority" {
                    
                    // Swapping elements if the priority of the preceding element
                    // is higher than that of the element that follows
                    if self.taskList[i].getPriority() > self.taskList[i+1].getPriority() {
                        let temp = self.taskList[i]
                        self.taskList[i] = self.taskList[i+1]
                        self.taskList[i+1] = temp
                    }
                    
                } else if filter == "time" {
                    
                    // Swapping elements if ETC of the preceding element
                    // is higher than that of the element that follows
                    if self.taskList[i].getTime() > self.taskList[i+1].getTime() {
                        let temp = self.taskList[i]
                        self.taskList[i] = self.taskList[i+1]
                        self.taskList[i+1] = temp
                    }
                    
                } else {
                    break
                }
            }
        }
    }
    
    // Returns estimate time of completion (ETC)
    func calculateTotalTime() -> Double {
        var totalTime = 0.0
        
        // Running sum of each of the task's ETC
        for task in self.taskList {
            totalTime += task.getTime()
        }
        return totalTime
    }
    
}
