//
//  AddNoteViewController.swift
//  Note App
//
//  Created by Matthew Shin on 2020-10-08.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    var note: Note?
    var update = false

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if update == true {
            titleTextField.text = note!.title
            bodyTextView.text = note!.note
        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if update == false {
            
            self.deleteButton.isEnabled = false
            self.deleteButton.title = ""
            
        }
    }

    @IBAction func saveClick(_ sender: Any) {
        
        if update == true {
            APIFunctions.functions.updateNote(id: note!._id, title: titleTextField.text!, date: "Placeholder", note: bodyTextView.text)
        } else {
            APIFunctions.functions.addNote(title: titleTextField.text!, date: "Placeholder", note: bodyTextView.text)            
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        
        APIFunctions.functions.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
}
