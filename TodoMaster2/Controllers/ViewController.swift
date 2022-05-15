//
//  ViewController.swift
//  TodoMaster2
//

import UIKit

class ViewController: UIViewController {
    
    // Outlet that connects to the table view
    @IBOutlet weak var tableView: UITableView!
    
    // Outlet that connects to the text field that
    // displays number of tasks and ETC
    @IBOutlet weak var statsTextField: UILabel!
    
    var todoList = TodoList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assigning the deta source and delegate of
        // the table view to the ViewController class
        tableView.dataSource = self
        tableView.delegate = self
        
        // Adding custom cell nib to table view
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }

    @IBAction func addTaskPressed(_ sender: UIBarButtonItem) {
        
        var nameTextField = UITextField()
        var priorityTextField = UITextField()
        var timeTextField =  UITextField()
        
        // Creating alert pop-up that promps users to add new tasks
        let alert = UIAlertController(title: "Add New Task", message: "", preferredStyle: .alert)
        
        
        // Adding text field to input task name
        alert.addTextField { (name) in
            name.placeholder = "Task Name"
            nameTextField = name
        }
        
        // Adding text field to input task priority
        alert.addTextField { (priority) in
            priority.placeholder = "Piority (1-10)"
            priority.keyboardType = .numberPad
            priorityTextField = priority
        }
        
        // Adding text field to input task completion time estimate
        alert.addTextField { (time) in
            time.placeholder = "Time Estimate (hrs)"
            time.keyboardType = .numberPad
            timeTextField = time
            
        }
        
        // Button for users to indicate that they finished inputting task information
        let action = UIAlertAction(title: "Add Task", style: .default) { (action) in
            
            // Adding new task with user prompted information
            let newTask = Task(name: nameTextField.text!, priority: Int(priorityTextField.text!)!, timeEstimate: Double(timeTextField.text!)!)
            self.todoList.addTask(task: newTask)
            
            // Updating status bar
            let stats = String(format: "You have %d task(s) to do with an ETC of %.2f hours", arguments: [self.todoList.getNumTasks(), self.todoList.calculateTotalTime()])
            self.statsTextField.text = stats
            
            // Updating table view with new tasks
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    // When upload symbol pressed, tasks will be sorted by their priority
    @IBAction func sortPriorityPressed(_ sender: UIBarButtonItem) {
        self.todoList.sortTasksWithFilter(filter: "priority")
        self.tableView.reloadData()
    }
    
    // When reload symbol pressed, tasks will be sorted by their ETC
    @IBAction func sortTimePressed(_ sender: UIBarButtonItem) {
        self.todoList.sortTasksWithFilter(filter: "time")
        self.tableView.reloadData()
    }
    
    
    
}

// The base code for the table view data source and delegate was written
// with the guidance of a YouTube video published by iOS Academy.
// Link to the video: https://www.youtube.com/watch?v=C36sb5sc6lE

extension ViewController: UITableViewDataSource {
    
    // Returning number of tasks as number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.getNumTasks()
    }
    
    // Populating each table item cell with task information from the task list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! ItemCell
        cell.nameLabel.text = todoList.taskList[indexPath.row].name
        cell.priorityLabel.text = String(todoList.taskList[indexPath.row].priority)
        cell.timeLabel.text = String(todoList.taskList[indexPath.row].timeEstimate)
        return cell
    }
    

}

extension ViewController: UITableViewDelegate {
    
    // Toggling background color of selected item cells
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if tableView.cellForRow(at: indexPath)?.backgroundColor == UIColor.black {
            tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.systemBlue
        } else {
            tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.black
        }
    }
    
}
