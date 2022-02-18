//
//  Accept_Screen.swift
//  let's hook
//
//  Created by Devolper.Scorpio on 06/01/2022.
//

import SwiftUI

struct Accept_Screen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                boycard.offset(x: 60,y: 120 )
                Girlcard.offset(x: -60 , y: -30 )
                Spacer()
                Text("It’s a match, John!").font(Font.custom("Sk-Modernist-Bold", size: 30)).foregroundColor(Color("Primery_Color"))
                Text("Start a conversation now with each other").font(Font.custom("Sk-Modernist-Regular", size: 14)).foregroundColor(Color("Primery_Color"))
                Custom_Button(name: "Say Hello!", isButton_Change: false, custom_padding: 30.0).padding(.top , 20).padding(.bottom , 20)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                Custom_Button(name: "Keep Swiping", isButton_Change: true, custom_padding: 30.0).padding(.bottom , 40)
                }
                }
        }.edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
    }
    var boycard : some View{
        Image("boy")
            .resizable()
            .frame(width: 180, height: 260)
            .cornerRadius(15)
            .overlay(
            Image("like")
                .rotationEffect(.degrees(10))
                .offset(x: -80 , y: -100)
            )
            .rotationEffect(.degrees(10))
            .animation(.easeIn, value: 10)
            .shadow(color: Color("Primery_Color"), radius: 90)
    }
    var Girlcard : some View{
        Image("girl")
            .resizable()
            .frame(width: 180, height: 260)
            .cornerRadius(15)
            .overlay(
                Image("like")
                    .offset(x: -80 , y: 140)
            )
            .rotationEffect(.degrees(-10))
            .animation(.easeIn, value: -10)
            .shadow(color: Color("Primery_Color"), radius: 90)
    }
}

struct Accept_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Accept_Screen()
    }
}
