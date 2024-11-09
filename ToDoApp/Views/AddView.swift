//
//  AddView.swift
//  ToDoApp
//
//  Created by Karim Michel on 2024-10-16.
//

import SwiftUI

struct AddView: View {
    
    //dismiss the add view
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type Something here ...",
                          text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(hue: 0.621, saturation: 0.048 , brightness: 0.916))
                .cornerRadius(10)
                
                Button(action: saveButtonTapped) {
                    Text("Save")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                }
            }.padding(16)
            
        }.navigationTitle("Add an Item")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    // save button
    func saveButtonTapped(){
        if textIsValid(){
            //update the item list
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss() //to close the add view.
        }
    }
    
    //text validation
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your toto item should have a minium of 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    //get alert
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    AddView()
}
