//
//  NewCardView.swift
//  SwipeableCards
//
//  Created by Brandon Baars on 1/9/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import SwiftUI

struct NewCardView: View {
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: LikeDislike = .none
    
    private var user: User
    private var onRemove: (_ user: User) -> Void
    
    private var thresholdPercentage: CGFloat = 0.5 // when the user has draged 50% the width of the screen in either direction
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
    init(user: User, onRemove: @escaping (_ user: User) -> Void) {
        self.user = user
        self.onRemove = onRemove
    }
    
    /// What percentage of our own width have we swipped
    /// - Parameters:
    ///   - geometry: The geometry
    ///   - gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                 ZStack(alignment: self.swipeStatus == .like ? .topLeading : .topTrailing) {
                    Image(self.user.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                        .clipped()
                        .overlay(
                            VStack{
                                HStack{
                                    HStack{
                                        Image("local_icon")
                                        Text("1 km").font(.custom("Sk-Modernist-bold", size: 14))
                                            .foregroundColor(.white)
                                    }.padding()
                                        .background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.4),.white.opacity(0.01)]), startPoint: .top, endPoint: .bottom))
//                                    .background(Blur().opacity(0.6))
                                        .cornerRadius(12)
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .background(Color("Primery_Color"))
                                        .clipShape(Circle())
                                }.padding()
                                Spacer()
                                
                                if self.swipeStatus == .like {
                                    HStack{
                                        Image("like")
                                            .resizable()
                                            .frame(width: 200, height: 200, alignment: .center)
                                        Spacer()
                                    }
                                } else if self.swipeStatus == .dislike {
                                    HStack{
                                        Spacer()
                                        Image("dislike")
                                            .resizable()
                                            .frame(width: 200, height: 200, alignment: .center)
                                    }
                                }
                                
                                Spacer()
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("\(self.user.firstName) \(self.user.lastName), \(self.user.age)")
                                            .font(.custom("Sk-Modernist-Bold", size: 30))
                                            .foregroundColor(.white)
                                        Text("\(self.user.occupation) | India")
                                            .font(.custom("Sk-Modernist-Regular", size: 18))
                                            .foregroundColor(.white)
                                    }.padding()
                                    Spacer()
                                }.background(Color.black.opacity(0.5))
                            }
                        )
                  
                }
            }
            
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                        
                        if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                            self.swipeStatus = .like
                        } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                            self.swipeStatus = .dislike
                        } else {
                            self.swipeStatus = .none
                        }
                        
                }.onEnded { value in
                    // determine snap distance > 0.5 aka half the width of the screen
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.user)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
    }
}

// 7
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView(user: User(id: 1, firstName: "Mark", lastName: "Bennett", age: 27, mutualFriends: 0, imageName: "person_1", occupation: "Insurance Agent"),
                 onRemove: { _ in
                    // do nothing
            })
            .frame(height: 400)
            .padding()
    }
}


struct User: Hashable, CustomStringConvertible {
    var id: Int
    
    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(firstName), id: \(id)"
    }
}

struct OurCardView: View {
        /// List of users
    @State var users: [User] = [
        User(id: 0, firstName: "Cindy", lastName: "Jones", age: 23, mutualFriends: 4, imageName: "person_1", occupation: "Coach"),
        User(id: 1, firstName: "Mark", lastName: "Bennett", age: 27, mutualFriends: 0, imageName: "person_2", occupation: "Insurance Agent"),
        User(id: 2, firstName: "Clayton", lastName: "Delaney", age: 20, mutualFriends: 1, imageName: "person_3", occupation: "Food Scientist"),
        User(id: 3, firstName: "Brittni", lastName: "Watson", age: 19, mutualFriends: 4, imageName: "person_4", occupation: "Historian"),
        User(id: 4, firstName: "Archie", lastName: "Prater", age: 22, mutualFriends:18, imageName: "person_5", occupation: "Substance Abuse Counselor"),
        User(id: 5, firstName: "James", lastName: "Braun", age: 24, mutualFriends: 3, imageName: "person_6", occupation: "Marketing Manager"),
        User(id: 6, firstName: "Danny", lastName: "Savage", age: 25, mutualFriends: 16, imageName: "person_7", occupation: "Dentist"),
        User(id: 7, firstName: "Chi", lastName: "Pollack", age: 29, mutualFriends: 9, imageName: "person_8", occupation: "Recreational Therapist"),
        User(id: 8, firstName: "Josue", lastName: "Strange", age: 23, mutualFriends: 5, imageName: "person_9", occupation: "HR Specialist"),
        User(id: 9, firstName: "Debra", lastName: "Weber", age: 28, mutualFriends: 13, imageName: "person_10", occupation: "Judge")
    ]
    
        /// Return the CardViews width for the given offset in the array
        /// - Parameters:
        ///   - geometry: The geometry proxy of the parent
        ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
        /// Return the CardViews frame offset for the given offset in the array
        /// - Parameters:
        ///   - geometry: The geometry proxy of the parent
        ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(users.count - 1 - id) * 10
    }
    
    private var maxID: Int {
        return self.users.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    ZStack {
                        ForEach(self.users, id: \.self) { user in
                            Group {
                                    // Range Operator
                                if (self.maxID - 3)...self.maxID ~= user.id {
                                    NewCardView(user: user, onRemove: { removedUser in
                                            // Remove that user from our array
                                        self.users.removeAll { $0.id == removedUser.id }
                                    })
                                        .animation(.spring())
                                        .frame(width: self.getCardWidth(geometry, id: user.id), height: 650)
                                        .offset(x: 0, y: -self.getCardOffset(geometry, id: user.id))
                                }
                            }
                        }
                    }
                   // Spacer()
                }
            }
        }.padding()
    }
}


