    //
    //  Message.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 01/01/2022.
    //

import SwiftUI

struct Message: View {
    @State var messages: Message_Class = Message_Class()
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Message").multilineTextAlignment(.leading)
                        .font(Font.custom("Sk-Modernist-Bold", size: 40).bold())
                    Spacer()
                    Image("Search_Icon").padding()
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray.opacity(0.4) ,style: StrokeStyle(lineWidth: 1.0)))
                }.padding(.top , 30).padding(30.0)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(messages.messages) { item in
                            HStack{
                                Image("pic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                                    .frame(width: 60, height: 60, alignment: .center)
                                VStack(alignment: .leading){
                                    Text(item.name).lineLimit(01).font(Font.custom("Sk-Modernist-Bold", size: 18).bold())
                                    Text(item.description).lineLimit(01).font(Font.custom("Sk-Modernist-Regular", size:16))
                                }
                                Spacer()
                                VStack(alignment: .center){
                                    Text(item.time).lineLimit(01).font(Font.custom("Sk-Modernist-Bold", size: 18).bold()).foregroundColor(Color.gray.opacity(0.6))
                                }
                                
                            }.padding(.leading , 30).padding(.trailing , 30).padding(.top , 10).padding(.bottom , 10)
                            Divider().padding(.leading , 30).padding(.trailing , 30)
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}

struct Message_Model: Identifiable, Equatable {
    let id = UUID()
    let name : String
    let description : String
    let time : String
    let badge : Int
}

struct Message_Class {
    
    var messages = [
        Message_Model(name: "Emelie", description: "Sticker 😍" , time: "23 min" , badge: 9 ),
        Message_Model(name: "Abigail", description: "Typing.." , time: "1 min" , badge: 2 ),
        Message_Model(name: "Grace", description: "Great I will write later.." , time: "23 min" , badge: 1 ),
        Message_Model(name: "Elizabeth", description: "Ok, see you then." , time: "23 min" , badge: 1 ),
        Message_Model(name: "Chloe", description: "You: Hello how are you?" , time: "23 min" , badge: 1 ),
        
    ]
}
