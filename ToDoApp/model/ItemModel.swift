//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Karim Michel on 2024-10-16.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    //Identifiable : this requires the struct to have a unique id
    //Codable: allows the struct to be easily encoded and decoded
    let title: String
    let isCompleted: Bool
    let id: String
    
    
    //UUID generate a universally unique identifier
    //because id has a default value it makes it optional parameter
    init(id: String = UUID().uuidString, Title: String, isCompleted: Bool)
    {
        self.id = id
        self.title = Title
        self.isCompleted = isCompleted
    }
    
    func updateCompleted() ->ItemModel {
        return ItemModel(id: id, Title: title, isCompleted: !isCompleted)
    }
}
