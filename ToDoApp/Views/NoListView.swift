//
//  NoListView.swift
//  ToDoApp
//
//  Created by Karim Michel on 2024-10-16.
//

import SwiftUI

struct NoListView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no new Items !!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Be more Productive and add todos to finish them on time !!")
                    .padding(.bottom, 20)
                
                
                //navigation link
                NavigationLink(destination: AddView()){
                    Text("Add something")
                        .foregroundStyle(.black)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ?
                                    Color("NewColor") : .blue)
                        .cornerRadius(10)
                }.padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? Color("NewColor").opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 50, x: 0, y: animate ? 50: 30 )
                    .offset(y:animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }.frame(width: .infinity, height: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 2.0)){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoListView()
}
