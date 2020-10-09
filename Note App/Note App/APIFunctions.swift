//
//  APIFunctions.swift
//  Note App
//
//  Created by Matthew Shin on 2020-10-08.
//

import Foundation
import Alamofire

class APIFunctions {
    
    // MARK: - Initialization
    
    // Sets our custom data delegate
    var delegate: DataDelegate?
    // Creates an instance of the class so the other files can interact with it
    static let functions = APIFunctions()
    
    // Fetches notes from database
    func fetchNotes() {
        AF.request("http://192.168.1.68:8081/fetch").response { response in
            print(response.data)
            //Converts the resopnse into utf8 string format
            let data =  String(data: response.data!, encoding: .utf8)
            // Fires off the custom delegate in the view controller
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    // Adds a note to the server, passing the arguments as headers
    func addNote(title: String, date: String, note: String) {
        
        AF.request("http://192.168.1.68:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note]).responseJSON { (response) in
            print(response)
        }
    }
    
    // Updates a note to the server, passing the arguments as headers
    func updateNote(id: String, title: String, date: String, note: String) {
        
        
        AF.request("http://192.168.1.68:8081/update", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id, "title": title, "date": date, "note": note]).responseJSON { (response) in
            print(response)
        }
    }
    
    // Deletes a note to the server, passing the notes id as a header
    func deleteNote(id: String) {
        
        AF.request("http://192.168.1.68:8081/delete", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id]).responseJSON { (response) in
            print(response)
        }
    }
    
}
