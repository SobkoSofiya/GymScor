//
//  TorsoSuccess.swift
//  GymScor
//
//  Created by Sofi on 11.03.2021.
//

import SwiftUI

struct TorsoSuccess: View {
    @Binding var transitionTren:Int
    @State var dayTorso = UserDefaults.standard.integer(forKey: "dayTorso")
    @State var time = UserDefaults.standard.integer(forKey: "timeTorso")
    @State var kal = UserDefaults.standard.integer(forKey: "kalTorso")
    
    @State var allkal = UserDefaults.standard.integer(forKey: "AllKal")
    @State var alltime = UserDefaults.standard.integer(forKey: "AllTime")
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("l"), Color("t")]), startPoint: .leading
                                           , endPoint: .trailing))
            VStack(spacing:0){
                Text("Sit-up").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
                HStack(spacing:110){
                    VStack{
                        Text("\(dayTorso)")
                        Text("Scores")
                    }
                    VStack{
                        Text("\(time)")
                        Text("Minutes")
                    }.offset(x: -10)
                    VStack{
                        Text("\(kal)")
                        Text("Kcal")
                    }
                }.foregroundColor(.white).font(.custom("ND Astroneer", size: 18)).padding(.bottom, 10)
                ZStack(alignment:.top){
                    Color.white
                    Button(action: {
                        UserDefaults.standard.set(allkal + kal, forKey: "AllKal")
                        UserDefaults.standard.set(alltime + time, forKey: "AllTime")
                      transitionTren = 1
                    }, label: {
                        ZStack{
                            Circle().strokeBorder(Color("te") ).frame(width: 317, height: 317, alignment: .center).foregroundColor(.clear)
                            Text("Success").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 75))
                        }
                    }).padding(.top,120)
                }
            }.offset( y: 40)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct TorsoSuccess_Previews: PreviewProvider {
    static var previews: some View {
        TorsoSuccess(transitionTren: .constant(1))
    }
}
