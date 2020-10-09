//
//  AddNoteViewController.swift
//  Note App
//
//  Created by Matthew Shin on 2020-10-08.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    // MARK: - Initialization
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    var note: Note?
    var update = false
    
    // MARK: - LifeCycle Hooks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prepopulates the text field if the user is updating a note
        if update == true {
            titleTextField.text = note!.title
            bodyTextView.text = note!.note
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Disables the delete button if the user isn't adding a note
        if update == false {
            self.deleteButton.isEnabled = false
            self.deleteButton.title = ""
        }
    }
    
    // MARK: - UI Buttons
    
    @IBAction func saveClick(_ sender: Any) {
        
        // Creates a date string that we can pass into the database
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: Date())
        
        // If the user is updating, update the note rather than saving
        if update == true {
            APIFunctions.functions.updateNote(id: note!._id, title: titleTextField.text!, date: date, note: bodyTextView.text)
            self.navigationController?.popViewController(animated: true)
        } else if titleTextField.text != "" && bodyTextView.text != "" {
            APIFunctions.functions.addNote(title: titleTextField.text!, date: date, note: bodyTextView.text)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        
        APIFunctions.functions.deleteNote(id: note!._id)
        // Returns the screen back to the main screen
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
