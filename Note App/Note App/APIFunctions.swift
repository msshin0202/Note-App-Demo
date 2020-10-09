//
//  APIFunctions.swift
//  Note App
//
//  Created by Matthew Shin on 2020-10-08.
//

import Foundation
import Alamofire

class APIFunctions {
    
    var delegate: DataDelegate?
    static let functions = APIFunctions()
    
    func fetchNotes() {
        
        AF.request("http://192.168.1.68:8081/fetch").response { response in
            
            let data =  String(data: response.data!, encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data!)
            
        }
        
    }
    
    func addNote(title: String, date: String, note: String) {
        
        AF.request("http://192.168.1.68:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note]).responseJSON { (response) in
            print(response)
        }
        
    }
    
    func updateNote(id: String, title: String, date: String, note: String) {
        
        
        AF.request("http://192.168.1.68:8081/update", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id, "title": title, "date": date, "note": note]).responseJSON { (response) in
            print(response)
        }
        
    }
    
    func deleteNote(id: String) {
        
        AF.request("http://192.168.1.68:8081/delete", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id]).responseJSON { (response) in
            print(response)
        }
        
    }
    
}
