//
//  PushUpTwo.swift
//  GymScor
//
//  Created by Sofi on 11.03.2021.
//

import SwiftUI
import SSSwiftUIGIFView
struct PushUpTwo: View {
    @Binding var transitionTren:Int
    @State var day = UserDefaults.standard.integer(forKey: "day")
//    @State var allDay = UserDefaults.standard.integer(forKey: "AllDay")
    @State var scores = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var sec = 0
    @State var timerToggle = false
    @State var time = UserDefaults.standard.integer(forKey: "time")
    @State var kal = UserDefaults.standard.integer(forKey: "kal")
    @State var kcal = 0
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("l"), Color("t")]), startPoint: .leading
                                           , endPoint: .trailing))
            VStack(spacing:0){
                Text("Push ups").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
                HStack(spacing:110){
                    VStack{
                        Text("\(scores)")
                        Text("Scores")
                    }
                    VStack{
                        Text("\(sec)")
                        Text("Minutes")
                    }.offset(x: -10)
                    VStack{
                        Text("\(sec == 0 ?  0 : Int(Double(sec/day)) )")
                        Text("Kcal")
                    }
                }.foregroundColor(.white).font(.custom("ND Astroneer", size: 18)).padding(.bottom, 10)
                ZStack(alignment:.top){
                    Color.white
                    VStack{
                        SwiftUIGIFPlayerView(gifName: "otzimania").frame(width: 330, height: 166, alignment: .center).padding(.top,40)
                        Button(action: {
                            if scores == 0 {
                                
                            } else{
                            scores = scores - 1
                            }
                            timerToggle = true
                        }, label: {
                            ZStack{
                                Circle().strokeBorder(Color("te") ).frame(width: 317, height: 317, alignment: .center).foregroundColor(.clear)
                                Text("Tap").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 75))
                            }
                        })
                        Button(action: {
                            if scores == 0{
                            UserDefaults.standard.set(sec, forKey: "time")
                                kcal = Int(Double(sec/day))
                                UserDefaults.standard.set(kcal, forKey: "kal")
                            timerToggle = false
                            transitionTren = 7
                            }
                        }, label: {
                            ZStack{
                          
                                RoundedRectangle(cornerRadius: 23.0).strokeBorder(Color("te") ).frame(width: 340, height: 45, alignment: .center)
                                    .foregroundColor(.clear)
                               
                                Text("Stop").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24))
                            }
                        }).padding(.top,20)
                       
                    }
                }
                Spacer()
            }.offset( y: 40)
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            scores = day
        }).onReceive(timer, perform: { (_) in
            if timerToggle{
                sec = sec + 1
            }
        })
    }
}

struct PushUpTwo_Previews: PreviewProvider {
    static var previews: some View {
        PushUpTwo( transitionTren: .constant(1))

    }
}
