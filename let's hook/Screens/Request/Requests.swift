    //
    //  Requests.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 01/01/2022.
    //

import SwiftUI

struct Requests: View {
    @State var requests: Requests_Class = Requests_Class()
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Who likes you").multilineTextAlignment(.leading).font(Font.custom("Sk-Modernist-Bold", size: 40))
                    Spacer()
                }.padding(.top , 30).padding(30.0)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack() {
                        ForEach(requests.Requests) { item in
                            
                            HStack{
                                Image("pic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                                    .frame(width: 60, height: 60, alignment: .center)
                                VStack(alignment: .leading){
                                    Text(item.name).lineLimit(01).font(Font.custom("Sk-Modernist-Bold", size: 18).bold())
                                    Text("\(item.years) | \(item.others) | \(item.country)")
                                        .lineLimit(01).font(Font.custom("Sk-Modernist-Regular", size:16))
                                }
                                Spacer()
                                VStack(alignment: .center){
                                    Text(item.time).lineLimit(01).font(Font.custom("Sk-Modernist-Bold", size: 18).bold()).foregroundColor(Color.gray.opacity(0.6))
                                }
                                
                            }.padding(.leading , 30).padding(.trailing , 30).padding(.top , 10).padding(.bottom , 2)
                            NavigationLink(destination: Accept_Screen()) {
                                HStack{
                                    HStack{
                                        Spacer()
                                        Text("Accept").font(Font.custom("Sk-Modernist-Regular", size: 12)).foregroundColor(.white).padding()
                                        Spacer()
                                    }.frame( height: 50)
                                        .background(Color("Primery_Color"))
                                        .cornerRadius(10.0)
                                }
                                Spacer()
                                HStack{
                                    Spacer()
                                    Text("Reject").font(Font.custom("Sk-Modernist-Regular", size: 12)).foregroundColor(Color("Primery_Color")).padding()
                                    Spacer()
                                }.frame(  height: 50)
                                    .background(Color.gray.opacity(0.4))
                                    .cornerRadius(10.0)
                                
                            }.padding(.leading , 90).padding(.trailing , 30)
                            Divider().padding(.leading , 30).padding(.trailing , 30)
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}


struct Requests_Previews: PreviewProvider {
    static var previews: some View {
        Requests()
    }
}


struct Requests_Model: Identifiable, Equatable {
    let id = UUID()
    let name : String
    let years : String
    let country : String
    let others : String
    let time : String
}

struct Requests_Class {
    
    var Requests = [
        Requests_Model(name: "Emelie", years: "22 years" ,country: "Canada", others: "Others" , time: "23 min" ),
        Requests_Model(name: "Abigail", years: "24 years" ,country: "Autraila", others: "Others" , time: "1 hr" ),
        Requests_Model(name: "Chloe", years: "19 years" ,country: "China", others: "Others" , time: "1 day" )
        
        
    ]
}
