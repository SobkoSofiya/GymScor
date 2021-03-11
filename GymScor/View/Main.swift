//
//  Main.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct Main: View {
    @State var offcetAnimation: CGFloat =  210
    @Binding var transitionTren:Int
    
    @State var allkal = UserDefaults.standard.integer(forKey: "AllKal")
    @State var alltime = UserDefaults.standard.integer(forKey: "AllTime")
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("l"), Color("t")]), startPoint: .leading
                                           , endPoint: .trailing))
            ZStack{
                RoundedRectangle(cornerRadius: 49).foregroundColor(.white).frame(width: 345, height: 659, alignment: .center)
                HStack(spacing:offcetAnimation == 210 ? 90 :  110){
                    VStack{
                        Text("0")
                        Text("Training")
                    }
                    VStack{
                        Text("\(allkal)")
                        Text("Kcal")
                    }
                    VStack{
                        Text("\(alltime)")
                        Text("Minutes")
                    }
                }.font(.custom("ND Astroneer", size: offcetAnimation == 210 ? 15 :18)).foregroundColor(offcetAnimation == 210 ?  Color("te") : .white).offset( y:offcetAnimation == 210 ? -250 :-360)
            }
            VStack(spacing:0){
                
                Text("Home Gym").foregroundColor(.white).font(.custom("ND Astroneer", size: 24)).offset(x:offcetAnimation == 210 ? 0 :  -130, y: offcetAnimation == 210 ? 0 : -10)
                Spacer()
            }.offset( y: 50)
            ZStack(alignment:.top){
                Color.white
            VStack{
                Button(action: {
                    transitionTren = 2
                }, label: {
                    ZStack{
                    Image("ha")
                        Text("Hands").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 18)).offset(x: -120, y: 50)
                }
                })
             
                Button(action: {
                    transitionTren = 2
                }, label: {
                    ZStack{
                    Image("s")
                        Text("Spine").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 18)).offset(x: -120, y: 50)
                }
                })
              
                Button(action: {
                    transitionTren = 4
                }, label: {
                    ZStack{
                    Image("t")
                        Text("Torso").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 18)).offset(x: -120, y: 50)
                }
                })
                
                Button(action: {
                    transitionTren = 2
                }, label: {
                    ZStack{
                    Image("l")
                        Text("Legs").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 18)).offset(x: -120, y: 50)
                }
                })
                
            }
            }.frame(width: UIScreen.main.bounds.width, height: 850, alignment: .center).offset( y: offcetAnimation)
            .animation(.linear)
            .gesture(DragGesture()
                        .onEnded({ (value) in
                            if  value.translation.height <= 50{
                                offcetAnimation = 90
                            }
                            if  -value.translation.height <= 50{
                                offcetAnimation = 210
                            }
                        })
            )
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main( transitionTren: .constant(1))
    }
}
