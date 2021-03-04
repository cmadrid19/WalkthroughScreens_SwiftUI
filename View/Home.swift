//
//  SwiftUIView.swift
//  WalkthroughScene
//
//  Created by Maxim Macari on 4/3/21.
//

import SwiftUI

//Global
var totalPages = 3

struct Home: View {
    var body: some View {
        WalckthroughScreen()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct WalckthroughScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{
        ZStack{
            //Changing between views
            switch currentPage {
            case 1:
                ScrenView(image: "house", title: "Step 1", detail: "", bgColor: Color.yellow)
                    .transition(.scale)
            case 2:
                ScrenView(image: "star", title: "Step 2", detail: "", bgColor: Color.red)
                    .transition(.scale)
            case 3:
                ScrenView(image: "key.fill", title: "Step 3", detail: "", bgColor: Color.green)
                    .transition(.scale)
            default:
                Text("")
            }
        }
        .overlay(
            Button(action: {
                withAnimation(.easeInOut){
                    if currentPage <= totalPages{
                        currentPage += 1
                    }else{
                        currentPage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                        ZStack{
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.white, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-10)
                        
                        
                    )
                    .padding(20)
            })
            .padding(.bottom, 20)
            ,alignment: .bottom
        )
        
    }
}




