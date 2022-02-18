    //
    //  Login_Screen.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 29/12/2021.
    //

import SwiftUI

struct Login_Screen: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var isChange : Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                if isChange == false {
                VStack(){
                    Image("let's_hook").resizable().frame(width: 120, height: 120, alignment: .center)
                    Text("Login to Continue").font(Font.custom("Sk-Modernist-Bold", size: 18)).padding(.top , 10).padding()
                    Text_Field(placeHolder: "Email", text: email)
                    Text_Field(placeHolder: "Password", text: password).padding(.top , 12)
                    HStack{
                        Spacer()
                        Text("Forget Password?").font(Font.custom("Sk-Modernist-Bold", size: 16)).foregroundColor(.red).padding(.top , 20)
                    }
                    Button {
                        isChange = true
                    } label: {
                        Custom_Button(name: "Sign In").padding(.top , 20).padding(.top , 20)
                    }
                    HStack(alignment: .center){
                        Text("Don’t have an Account?").font(Font.custom("Sk-Modernist-Regular", size: 14))
                        NavigationLink(destination: Signup_Screen()) {
                            Text("Register Now").font(Font.custom("Sk-Modernist-Bold", size: 16)).foregroundColor(.red)
                        }
                    }.padding(.top , 60)
                }.padding(.leading , 30).padding(.trailing , 30)
                }else{
                    Tab_Bar()
                }
            }
        }
    }
}

struct Login_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Login_Screen()
    }
}
