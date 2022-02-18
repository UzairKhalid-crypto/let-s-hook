    //
    //  Border_Button.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 05/01/2022.
    //

import SwiftUI

struct Border_Button: View {
    @State var name : String = ""
    @State var des : String = ""
    @State var show_des : Bool = false
    @State var custom_padding : Double = 0.0
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(name).font(Font.custom("Sk-Modernist-Regular", size: 16)).padding(.leading , 20).foregroundColor(.black)
                if show_des {
                    Text(des).font(Font.custom("Sk-Modernist-Bold", size: 18)).padding(.leading , 30).foregroundColor(.black)
                }
            }.padding(.top , custom_padding).padding(.bottom , custom_padding)
            Spacer()
            Image("Forward_Arrow")
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
                .padding()
        }
        .overlay(RoundedRectangle(cornerRadius: 15.0).strokeBorder(Color.gray.opacity(0.4) ,style: StrokeStyle(lineWidth: 1.0))).padding(.top , 10).padding(.bottom , 10).padding(.leading , 30).padding(.trailing , 30)
    }
}

struct Border_Button_Previews: PreviewProvider {
    static var previews: some View {
        Border_Button()
    }
}
