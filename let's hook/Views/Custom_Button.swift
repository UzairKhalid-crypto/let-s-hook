    //
    //  Custom_Button.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 29/12/2021.
    //

import SwiftUI

struct Custom_Button: View {
    @State var name : String = ""
    @State var isButton_Change : Bool = false
    @State var custom_padding : Double = 0.0
    var body: some View {
        if isButton_Change{
            HStack{
                Spacer()
                Text(name).font(Font.custom("Sk-Modernist-Bold", size: 18)).foregroundColor(Color("Primery_Color")).padding()
                Spacer()
            }.frame( height: 70)
                .background(Color.gray.opacity(0.4))
                .cornerRadius(18.0)
                .padding(.leading , custom_padding).padding(.trailing , custom_padding)
               
        }else{
            HStack{
                Spacer()
                Text(name).font(Font.custom("Sk-Modernist-Bold", size: 18)).foregroundColor(.white).padding()
                Spacer()
            }.frame( height: 70)
                .background(Color("Primery_Color"))
                .cornerRadius(18.0)
                .padding(.leading , custom_padding).padding(.trailing , custom_padding)
        }
    }
}

struct Custom_Button_Previews: PreviewProvider {
    static var previews: some View {
        Custom_Button()
    }
}
