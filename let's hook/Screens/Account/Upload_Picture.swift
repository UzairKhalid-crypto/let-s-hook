    //
    //  Upload_Picture.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 05/01/2022.
    //

import SwiftUI

struct Upload_Picture: View {
    @State var text : String = ""
    @State var showImagePicker: Bool = false
    @State var image: Image?
    var body: some View {
        ZStack{
            VStack{
                Back_Button()
                HStack{
                    Text("Upload Pictures").multilineTextAlignment(.leading).font(Font.custom("Sk-Modernist-Bold", size: 40))
                    Spacer()
                }.padding(.leading).padding(.top , 10)
                    //Feilds
                VStack {
                    Button(action: {
                        withAnimation {
                            self.showImagePicker.toggle()
                        }
                    }) {
                        HStack{
                            if image == nil {
                                
                                Image("let's_hook")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                            else{
                                image?.resizable()
                            }
                        }.frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .overlay(
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .foregroundColor(.gray)
                                    .frame(width: 30, height: 30, alignment: .trailing)
                                    .offset(x: 75, y: 65)
                            )
                        
                    }
                        //image?.resizable().frame(width: 100, height: 100)
                }
                Spacer()
                HStack{
                    Text("Bio").font(Font.custom("Sk-Modernist-Bold", size: 18)).padding(.leading)
                    Spacer()
                }
                TextEditor(text: $text).font(Font.custom("Sk-Modernist-Regular", size: 18))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray.opacity(0.4) ,style: StrokeStyle(lineWidth: 1.0)))
                    .frame( height: 250, alignment: .center)
                    .padding()
                Spacer()
                Custom_Button(name: "Next", isButton_Change: false, custom_padding: 10).padding(.bottom , 20)
                
            }.edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
                .padding(.top , 30)
                .padding(.leading , 30)
                .padding(.trailing ,30)
        }.sheet(isPresented : $showImagePicker){
            VStack{
                OpenGallary(isShown: $showImagePicker, image: $image)
            }.edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct Upload_Picture_Previews: PreviewProvider {
    static var previews: some View {
        Upload_Picture()
    }
}
