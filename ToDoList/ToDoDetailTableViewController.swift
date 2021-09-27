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
    
    var toDoItem: ToDoItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDoItem == nil {
            toDoItem = ToDoItem(name: "", date: Date(), notes: "")
        }
        
        nameField.text = toDoItem.name
        datePicker.date = toDoItem.date
        noteView.text = toDoItem.notes
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        toDoItem = ToDoItem(name: nameField.text!, date: datePicker.date, notes: noteView.text)
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
