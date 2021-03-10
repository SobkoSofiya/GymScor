//
//  Back.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct Back: View {
    @StateObject var model = ViewModel()
    @State var name = UserDefaults.standard.string(forKey: "name")
    @State var show = UserDefaults.standard.bool(forKey: "show")
    @Binding var transition:Int
    var body: some View {
        ZStack{
            Color.white
            Button(action: {
                model.signOut(name: name!)
                transition = 1
            }, label: {
                Text("Back").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 50))
            })
           
        }
    }
    func alertCustom()  {
//        let alert = UIAlertController
    }
}

struct Back_Previews: PreviewProvider {
    static var previews: some View {
        Back( transition: .constant(1))
    }
}
