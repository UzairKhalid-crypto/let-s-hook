//
//  Change_Password.swift
//  let's hook
//
//  Created by Devolper.Scorpio on 06/01/2022.
//

import SwiftUI

struct Change_Password: View {
    @State var current_passord : String = ""
    @State var password : String = ""
    @State var confirm_password : String = ""
    var body: some View {
        ZStack{
            VStack{
                
                Back_Button().padding(.top , 60)
                HStack{
                    Text("Change Password").multilineTextAlignment(.leading).font(Font.custom("Sk-Modernist-Bold", size: 40).bold())
                    Spacer()
                }.padding(.leading).padding(.top , 20)
                Text("Create a new password and use it next time you sign in.").lineLimit(02).multilineTextAlignment(.leading).font(Font.custom("Sk-Modernist-Regular", size: 14)).padding(.bottom , 20).padding(.top , 2).padding(.leading)
                Text_Field(placeHolder: "Current Password", text: current_passord)
                Text_Field(placeHolder: "Password", text: password).padding(.top , 12)
                Text_Field(placeHolder: "Confirm Password", text: confirm_password).padding(.top , 12)
                Custom_Button(name: "Change Password").padding(.top , 20).padding(.top , 20)
                
                Spacer()
            }.padding(.leading , 30).padding(.trailing , 30)
        }.edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
    }
}

struct Change_Password_Previews: PreviewProvider {
    static var previews: some View {
        Change_Password()
    }
}
