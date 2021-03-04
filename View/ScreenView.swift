//
//  ScreenView.swift
//  WalkthroughScene
//
//  Created by Maxim Macari on 4/3/21.
//

import SwiftUI

struct ScrenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                if currentPage == 1 {
                    Text("Hello number")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }else{
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(Color.black)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(15)
                .background(bgColor)
                .shadow(color: bgColor, radius: 10, x: 5, y: 5)
                .shadow(color: bgColor, radius: 10, x: -5, y: -5)
                .cornerRadius(15)
                .padding(.top)
            
            Text("Lore ipsum is dummy text used in lying out print, graphic or weeb designs.")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            
            //Minimum spacing when phone is reducing
            
            Spacer(minLength: 100)
        }
        .background(bgColor.opacity(0.5).ignoresSafeArea())
    }
}
