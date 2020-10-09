//
//  ViewController.swift
//  Note App
//
//  Created by Matthew Shin on 2020-10-08.
//

import UIKit

protocol DataDelegate {
    
    func updateArray(newArray: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var notesArray = [Note]()
    
    @IBOutlet weak var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddNoteViewController
        
        if segue.identifier == "updateNoteSegue" {
            
            vc.note = notesArray[notesTableView.indexPathForSelectedRow!.row]
            vc.update = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        cell.textLabel?.text = notesArray[indexPath.row].title
        return cell
    }



}

extension ViewController: DataDelegate {
    
    
    func updateArray(newArray: String) {

        do {
            
            notesArray = try JSONDecoder().decode([Note].self, from: newArray.data(using: .utf8)!)
            
        } catch {
            
            print("Failed to decode!")
            
        }
        self.notesTableView.reloadData()
        
    }
    
    
    
    
}

