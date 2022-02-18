//
//  Explore.swift
//  let's hook
//
//  Created by Devolper.Scorpio on 30/12/2021.
//

import SwiftUI

struct Explore: View {
    @State var filter_Switch : Bool = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Discover").multilineTextAlignment(.leading)
                        .font(.custom("Sk-Modernist-Bold", size: 40))
                    Spacer()
                    Button {
                        filter_Switch.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 10).style(
                            withStroke: filter_Switch  ? Color.white :Color.gray.opacity(0.4),
                            lineWidth: 2,
                            fill: filter_Switch  ? Color("Primery_Color") :Color.white
                        ).frame(width: 60, height: 60, alignment: .center).overlay(Image( filter_Switch  ? "Filter_Active" : "Filter_Inactive").padding())
                    }
                }.padding(.top , 30).padding(30.0)
            
                OurCardView()
                
            }
        }.edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
