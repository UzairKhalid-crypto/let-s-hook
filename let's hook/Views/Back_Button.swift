    //
    //  Back_Button.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 30/12/2021.
    //

import SwiftUI

struct Back_Button: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray.opacity(0.4) ,style: StrokeStyle(lineWidth: 1.0)))
                Spacer()
            }
        }
    }
}

struct Back_Button_Previews: PreviewProvider {
    static var previews: some View {
        Back_Button()
    }
}
