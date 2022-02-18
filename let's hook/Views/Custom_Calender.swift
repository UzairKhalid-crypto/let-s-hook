//
//  Custom_Calender.swift
//  let's hook
//
//  Created by Devolper.Scorpio on 05/01/2022.
//

import SwiftUI

struct Custom_Calender: View {
    
    @State private var date = Date()
    @State var showingSheet : Bool = true
    @Binding var custom_date_sheet : String
    
    var body: some View {
        VStack{
            Spacer().onTapGesture {
                showingSheet = false
            }
            VStack{
                Text("Birthday").multilineTextAlignment(.leading).font(Font.custom("Sk-Modernist-Bold", size: 40)).padding(.top , 20)
                DatePicker("Enter your birthday", selection: $date , displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 350)
                Spacer()
            }.frame(width: UIScreen.screenWidth, height: 500, alignment: .bottom)
             .background(Color.white)
             .clipShape(RoundedCorners(tl: 30, tr: 30, bl: 0, br: 0))
             .overlay(
                Image("indicator")
                    .resizable()
                    .frame(width: 60, height: 30, alignment: .center)
                    .offset(y: -240).shadow(color: .gray, radius: 30)
             )
        }.edgesIgnoringSafeArea(.all)
         .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
         .background(Color.black.opacity(0.4))
         .onChange(of: date) { newValue in
             //variables.date = "\(newValue)"
             custom_date_sheet = newValue.originToString(dateFormat: "dd/MM/yy")
            
         }
    }
    
}

//struct Custom_Calender_Previews: PreviewProvider {
//    static var previews: some View {
//        Custom_Calender()
//    }
//}




