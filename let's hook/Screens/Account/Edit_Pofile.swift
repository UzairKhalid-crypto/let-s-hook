    //
    //  Edit_Pofile.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 05/01/2022.
    //

import SwiftUI

struct Edit_Pofile: View {
    
    @State var name : String = ""
    @State var gender : String = ""
    @State var intrested_In : String = ""
    @State var location : String = ""
    @State var custom_date : String = ""
    
    @State private var showingSheet = false
    var body: some View {
        ZStack{
            VStack{
                Back_Button().padding(.top , 60)
                HStack{
                    Text("Profile Details").multilineTextAlignment(.leading).font(Font.custom("Sk-Modernist-Bold", size: 40))
                    Spacer()
                }.padding(.leading).padding(.top , 10)
                    //Feilds
                ScrollView(.vertical , showsIndicators: false){
                    Text_Field(placeHolder: "Your Name", text: name)
                    Custom_Picker( list_id : 1, text: "Select Gender", save_in: gender).padding(.top)
                    Custom_Picker( list_id : 2, text: "You're intrested in", save_in: intrested_In ).padding(.top)
                    Custom_Picker( list_id : 3, text: "Select Location", save_in: location).padding(.top)
                    calender_feild.padding(.top)
                }
                NavigationLink(destination:Upload_Picture()){
                    Custom_Button(name: "Next", isButton_Change: false, custom_padding: 10).padding(.bottom , 20)
                }
            }.padding(.leading , 30).padding(.trailing , 30)
            if showingSheet {
                Custom_Calender(showingSheet: showingSheet ,custom_date_sheet: $custom_date)
                    .animation(.spring())
                    .gesture(
                        DragGesture()
                            .onEnded{ value in
                                showingSheet = false
                            }
                    )
            }
        }.edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
    }
    var calender_feild : some View{
        HStack{
            Text(custom_date == "" ? "Select your Date of Birth": custom_date).font(Font.custom("Sk-Modernist-Regular", size: 16))
                .padding()
            Spacer()
            Button {
                showingSheet = true
            } label: {
                Image("Calender_Icon")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    .padding()
            }
        }.overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray.opacity(0.4) ,style: StrokeStyle(lineWidth: 1.0)))
    }
    
}

    //struct Edit_Pofile_Previews: PreviewProvider {
    //    static var previews: some View {
    //        Edit_Pofile()
    //    }
    //}
