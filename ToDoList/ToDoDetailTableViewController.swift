//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Andrew Chapman on 9/24/21.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {

    @IBOutlet weak var noteView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    var toDoItem: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDoItem == nil {
            toDoItem = ""
        }
        
        nameField.text = toDoItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        toDoItem = nameField.text
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentedInAddMode = presentingViewController is UINavigationController
        if isPresentedInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
