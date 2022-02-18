    //
    //  Tab_Bar.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 30/12/2021.
    //

import SwiftUI

struct Tab_Bar: View {
    
    @State var index : Int = 0
    var body: some View{
        VStack{
            if index == 0 {Explore()}
            else if index == 1 { Message() }
            else if index == 2 { Requests() }
            else if index == 3 { Accounts() }
        }.edgesIgnoringSafeArea(.all)
            .overlay(
                VStack{
                    Spacer()
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                        HStack(alignment : .bottom){
                            Spacer()
                            Group(){
                                Button {
                                    self.index = 0
                                } label: {
                                    Image( index == 0 ?  "Explore_Active" : "Explore_Inactive")
                                }
                                Spacer()
                                Button {
                                    self.index = 1
                                } label: {
                                    Image( index == 1 ? "Msg_Active" : "Msg_Inactive")
                                }
                                Spacer()
                                Button {
                                    self.index = 2
                                } label: {
                                    Image( index == 2 ? "Requests_Active" : "Requests_Inactive" )
                                }
                                Spacer()
                                Button {
                                    self.index = 3
                                } label: {
                                    Image( index == 3 ? "Account_Active" : "Account_Inactive")
                                }
                            }
                            Spacer()
                        }.padding(.top, 5).padding(.bottom, 20)
                    })
                        .frame(width: UIScreen.screenWidth , height: 100)
                        .background(Color.white)
                        .clipShape(RoundedCorners(tl: 30, tr: 30, bl: 0, br: 0))
                        .shadow(radius: 5)
                }.edgesIgnoringSafeArea(.all)
            )
    }
}

struct Tab_Bar_Previews: PreviewProvider {
    static var previews: some View {
        Tab_Bar()
    }
}

