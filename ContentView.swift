//
//  ContentView.swift
//  WalkthroughScene
//
//  Created by Maxim Macari on 4/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        if currentPage > totalPages {
            VStack{
                
                Text("Home")
                    .padding(.vertical, 100)
                  
                Button(action: {
                    withAnimation(.spring()){
                        currentPage = 1
                    }
                }, label: {
                    Text("Watch tutorial again")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(15)
                        
                })
                .buttonStyle(PlainButtonStyle())
            }
            
        }else{
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
