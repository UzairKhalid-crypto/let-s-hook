//
//  Signup_Screen.swift
//  let's hook
//
//  Created by Devolper.Scorpio on 29/12/2021.
//

import SwiftUI

struct Signup_Screen: View {
    @State var email : String = ""
    @State var password : String = ""
    @State var confirm_password : String = ""
    var body: some View {
            ZStack{
                VStack{
                    
                    Back_Button().padding(.top , 60)
                    HStack{
                    Text("Register").multilineTextAlignment(.leading).font(Font.custom("Sk-Modernist-Bold", size: 40).bold())
                        Spacer()
                    }.padding(.leading).padding(.top , 20)
                    Text("Welcome to let's_hook, Register yourself to continue").lineLimit(02).multilineTextAlignment(.leading).font(Font.custom("Sk-Modernist-Regular", size: 14)).padding(.top , 5).padding()
                    Text_Field(placeHolder: "Email", text: email)
                    Text_Field(placeHolder: "Password", text: password).padding(.top , 12)
                    Text_Field(placeHolder: "Confirm Password", text: confirm_password).padding(.top , 12)
                    Custom_Button(name: "Register").padding(.top , 20).padding(.top , 20)
                    HStack(alignment: .center){
                        Text("Already have an Account?").font(Font.custom("Sk-Modernist-Regular", size: 14))
                        NavigationLink(destination: Signup_Screen()) {
                            Text("Login Now").font(Font.custom("Sk-Modernist-Bold", size: 16)).foregroundColor(.red)
                        }
                    }.padding(.top , 80)
                    Spacer()
                }.padding(.leading , 30).padding(.trailing , 30)
            }.edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
    }
}

struct Signup_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Signup_Screen()
    }
}
