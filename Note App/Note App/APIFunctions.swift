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
    
}
