//
//  ListRowView.swift
//  ToDoApp
//
//  Created by Karim Michel on 2024-10-16.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

#Preview {
    Group{
        ListRowView(item: ItemModel(Title: "Something", isCompleted: true ))
        ListRowView(item: ItemModel(Title: "New", isCompleted: false ))
    }
}
