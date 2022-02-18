    //
    //  Accounts.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 05/01/2022.
    //

import SwiftUI
struct Accounts: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Account").multilineTextAlignment(.leading)
                        .font(Font.custom("Sk-Modernist-Bold", size: 40).bold())
                    Spacer()
                }.padding(.top , 30).padding(30.0)
                HStack{
                    Image("pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60, alignment: .center)
                    VStack(alignment: .leading){
                        Text("Emelie Clarke").lineLimit(01).font(Font.custom("Sk-Modernist-Bold", size: 18).bold())
                        Text("Canada").lineLimit(01).font(Font.custom("Sk-Modernist-Regular", size:16))
                    }
                    Spacer()
                    VStack(alignment: .center){
                        NavigationLink(destination: Edit_Pofile(), label: {
                            Text("Edit").lineLimit(01).font(Font.custom("Sk-Modernist-Bold", size: 18).bold()).foregroundColor(Color.gray.opacity(0.6))
                        })
                    }
                }.padding(.leading , 50).padding(.trailing , 50).padding(.top , 10).padding(.bottom , 10)
                ScrollView(.vertical , showsIndicators: false){
                   // NavigationLink(destination: Edit_Pofile(), label: {
                        Border_Button(name: "Subscription", des: "Basic", show_des: true ,custom_padding: 20.0)
                    //})
                    NavigationLink(destination: Change_Password(), label: {
                        Border_Button(name: "Change Password", des: "", show_des: false,custom_padding: 25.0)
                    })
                    NavigationLink(destination: About_Us(), label: {
                        Border_Button(name: "About Us", des: "", show_des: false,custom_padding: 25.0)
                    })
                    NavigationLink(destination: Terms_Conditions(), label: {
                        Border_Button(name: "Terms & Conditions", des: "", show_des: false,custom_padding: 25.0)
                    })
//                    NavigationLink(destination: Edit_Pofile(), label: {
                        Custom_Button(name: "Delete Profile", isButton_Change: true, custom_padding: 30.0)
                   // })
                    //NavigationLink(destination: Edit_Pofile(), label: {
                        Custom_Button(name: "Logout", isButton_Change: false, custom_padding: 30.0)
                            .padding(.top , 10).padding(.bottom , 140)
                    //})
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Accounts_Previews: PreviewProvider {
    static var previews: some View {
        Accounts()
    }
}

