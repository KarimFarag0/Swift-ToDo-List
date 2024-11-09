//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Karim Michel on 2024-10-16.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    } //@Publish is like the @State variable but for the entire app
    //will run everytime there is change in the variable , like add, delete , update , move ...
    
    let itemKeys: String = "items_list"
    
    func saveItems()
    {
        if let encodedData = try? JSONEncoder().encode(items)
        {
            //UserDefault -> app level variable
            UserDefaults.standard.set(encodedData, forKey: itemKeys)
        }
    }
    
    
    func getItems()
    {
        guard let data = UserDefaults.standard.data(forKey: itemKeys) else { return }
        
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        
        self.items = saveItems
    }
    
    //add an item (todo)
    func addItem(title: String)
    {
        let newItem = ItemModel(Title: title, isCompleted: false)
        items.append(newItem) //will run the @published -> didSet{saveItems()}
    }
    
    
    //update an item
    func update(item: ItemModel)
    {
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompleted() // toggle the bool value
        }
    }
    
    //delete an item
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet) //remove all the occurances of the index set
    }
    
    //move an item
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
}
