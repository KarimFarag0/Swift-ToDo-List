//
//  ContentView.swift
//  ToDoApp
//
//  Created by Karim Michel on 2024-10-16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some View {
        NavigationView{
           ListView()
        }.environmentObject(listViewModel)
    }
}

#Preview {
    ContentView()
}
