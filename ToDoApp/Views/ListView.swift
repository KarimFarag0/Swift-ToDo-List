//
//  ListView.swift
//  ToDoApp
//
//  Created by Karim Michel on 2024-10-16.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listViewModel.items){
                        item in ListRowView(item: item)
                            .onTapGesture{
                                withAnimation(.easeOut(duration: 1.1)){
                                    listViewModel.update(item: item)
                                }
                            }
                            
                    }.onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                }
            }
            
            
        }.navigationTitle("Todo List ")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
}
