//
//  Note.swift
//  Note App
//
//  Created by Matthew Shin on 2020-10-08.
//

import Foundation

struct Note: Decodable {
    
    var title: String
    var date: String
    var _id: String
    var note: String
}
