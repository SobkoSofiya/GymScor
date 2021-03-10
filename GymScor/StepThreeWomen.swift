//
//  StepThreeWomen.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct StepThreeWomen: View {
    @Binding var transition:Int
    @State var color = 0
    var body: some View {
        ZStack{
            Color("for")
            Image("wo").offset(x: 200, y: 150)
            VStack{
                Text("Step 3/5").foregroundColor(.white).font(.custom("ND Astroneer", size: 50))
                Text("What do you want to work on?").foregroundColor(.white).font(.custom("ND Astroneer", size: 18)).padding(50)
                VStack(spacing:20){
                    Button(action: {
                        color = 1
                        transition = 5
                    }, label: {
                        HStack(spacing:0){
                           
                            ZStack{
                                RoundedRectangle(cornerRadius: 39).foregroundColor(color == 1 ? Color("be") : .white).frame(width: 172, height: 46, alignment: .center)
                                Text("Hands").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 14))
                            }
                            Rectangle().frame(width: 111, height: 1, alignment: .center).foregroundColor(.white)
                            Circle().strokeBorder(Color("te") )
                                .frame(width: 15, height: 15, alignment: .center).foregroundColor(.clear).background(Circle().foregroundColor(.white))
                        }

                    })
                    Button(action: {
                        color = 2
                        transition = 5
                    }, label: {
                        HStack(spacing:0){
                           
                            ZStack{
                                RoundedRectangle(cornerRadius: 39).foregroundColor(color == 2 ? Color("be") : .white).frame(width: 172, height: 46, alignment: .center)
                                Text("Spine").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 14))
                            }
                            Rectangle().frame(width: 130, height: 1, alignment: .center).foregroundColor(.white)
                            Circle().strokeBorder(Color("te") )
                                .frame(width: 15, height: 15, alignment: .center).foregroundColor(.clear).background(Circle().foregroundColor(.white))
                        }

                    }).offset(x: 10)
                    Button(action: {
                        color = 3
                        transition = 5
                    }, label: {
                        HStack(spacing:0){
                           
                            ZStack{
                                RoundedRectangle(cornerRadius: 39).foregroundColor(color == 3 ? Color("be") : .white).frame(width: 172, height: 46, alignment: .center)
                                Text("Torso").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 14))
                            }
                            Rectangle().frame(width: 163, height: 1, alignment: .center).foregroundColor(.white)
                            VStack(spacing:0){
                                Circle().strokeBorder(Color("te") )
                                    .frame(width: 15, height: 15, alignment: .center).foregroundColor(.clear).background(Circle().foregroundColor(.white))
                            Rectangle()
                                .frame(width: 1, height: 15, alignment: .center).foregroundColor(.white)
//                                .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                       
                            }.offset(x: -6, y: -15)
                        }

                    }).offset(x: 27)
                    Button(action: {
                        color = 4
                        transition = 5
                    }, label: {
                        HStack(spacing:0){
                           
                            ZStack{
                                RoundedRectangle(cornerRadius: 39).foregroundColor(color == 4 ? Color("be") : .white).frame(width: 172, height: 46, alignment: .center)
                                Text("Legs").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 14))
                            }
                            Rectangle().frame(width: 111, height: 1, alignment: .center).foregroundColor(.white)
                            Circle().strokeBorder(Color("te") )
                                .frame(width: 15, height: 15, alignment: .center).foregroundColor(.clear).background(Circle().foregroundColor(.white))
                        }

                    })
                    
                    
                }.offset(x: -1, y: 35)
                Spacer()
            }.offset( y: 200)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct StepThreeWomen_Previews: PreviewProvider {
    static var previews: some View {
        StepThreeWomen(transition: .constant(1))
    }
}
