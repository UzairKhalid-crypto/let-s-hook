//
//  Splash_Screen.swift
//  let's hook
//
//  Created by Devolper.Scorpio on 29/12/2021.
//

import SwiftUI

struct Splash_Screen: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack{
            if self.isActive{
                Login_Screen()
            }else{
                splash
            }
        }.edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    //Splash Screen
    var splash : some View{
        VStack{
            Image("let's_hook").resizable().frame(width: 120, height: 120, alignment: .center)
            Text("Let's Hook").font(Font.custom("Sk-Modernist-Bold", size: 18)).padding(.top , 20)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Splash_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Splash_Screen()
    }
}
