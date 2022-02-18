    //
    //  Text_Field.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 29/12/2021.
    //

import SwiftUI

struct Text_Field: View {
    @State var placeHolder : String = ""
    @State var text : String = ""
    var body: some View {
        HStack{
            TextField(placeHolder , text: $text)
                .padding()
        }.overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray.opacity(0.4) ,style: StrokeStyle(lineWidth: 1.0)))
    }
}

struct Text_Field_Previews: PreviewProvider {
    static var previews: some View {
        Text_Field()
    }
}
