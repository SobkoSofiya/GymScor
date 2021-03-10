//
//  BottomMenu.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct BottomMenu: View {
    @Binding var transition:Int
    @State var selection  = 1
    var body: some View {
        ZStack{
        TabView(selection:$selection){
            Main().tabItem { VStack{
                Image("pl")
                Text("Plan").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
            } }.tag(1)
            Lessons().tabItem { VStack{
                Image("e")
                Text("Lessons").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
            } }.tag(2)
            Profile(transition: $transition).tabItem { VStack{
                Image("p")
                Text("Profile").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
            } }.tag(2)
        }
        }.edgesIgnoringSafeArea(.all)
    }
}

//struct BottomMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomMenu()
//    }
//}
