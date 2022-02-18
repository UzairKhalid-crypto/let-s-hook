    //
    //  Custom_Picker.swift
    //  let's hook
    //
    //  Created by Devolper.Scorpio on 05/01/2022.
    //

import SwiftUI

struct Custom_Picker: View {
    @State var list_id : Int = 0
    @State var text : String = ""
    @State var save_in : String = ""

    
    @State private var angle: Double = 0
    @State private var isMenu : Bool = false
    @State var list: Picker_Lists = Picker_Lists()
    var body: some View {
        VStack{
            HStack{
                Text(text).font(Font.custom("Sk-Modernist-Regular", size: 16))
                    .padding()
                Spacer()
                Button {
                    custom_toggle()
                } label: {
                    Image("Forward_Arrow")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .padding()
                        .rotationEffect(.degrees(angle))
                        .animation(.easeIn, value: angle)
                }
            }
            if isMenu{
                VStack{
                    ScrollView(.vertical , showsIndicators: false){
                        if list_id == 1 {
                            ForEach(list.Gender , id : \.self){ item in
                                Text(item).font(Font.custom("Sk-Modernist-Regular", size: 16)).padding()
                                    .onTapGesture {
                                        text = item
                                        save_in = item
                                        custom_toggle()
                                    }
                                Divider().padding(.leading , 20).padding(.trailing , 20)
                            }
                        }else if list_id == 2 {
                            ForEach(list.Intrested , id : \.self){ item in
                                Text(item).font(Font.custom("Sk-Modernist-Regular", size: 16))
                                    .onTapGesture {
                                        text = item
                                        save_in = item
                                        custom_toggle()
                                    }
                                Divider().padding()
                            }
                        }else if list_id == 3 {
                            ForEach(list.country_list , id : \.self){ item in
                                Text(item).font(Font.custom("Sk-Modernist-Regular", size: 16))
                                    .onTapGesture {
                                        text = item
                                        save_in = item
                                        custom_toggle()
                                    }
                                Divider().padding()
                            }
                        }else if list_id == 4 {
                            ForEach(list.Gender , id : \.self){ item in
                                Text(item).font(Font.custom("Sk-Modernist-Regular", size: 16))
                                    .onTapGesture {
                                        text = item
                                        save_in = item
                                        custom_toggle()
                                    }
                                Divider().padding()
                            }
                        }
                    }
                }.frame( height: 150, alignment: .center)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12.0)
                    .padding()
            }
        }.overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray.opacity(0.4) ,style: StrokeStyle(lineWidth: 1.0)))
    }
    func custom_toggle(){
        if angle == 0 {
            angle += 90
        }else{
            angle -= 90
        }
        isMenu.toggle()
    }
}

struct Custom_Picker_Previews: PreviewProvider {
    static var previews: some View {
        Custom_Picker()
    }
}

class Picker_Lists {
    var Gender = ["Male" , "Female" , "Other"]
    var Intrested = ["Male" , "Female" , "Other"]
    var country_list = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
}
