//
//  StepFour.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct StepFour: View {
    @Binding var transition:Int
    @State var color = 0
    var body: some View {
        ZStack{
            Color("for")
            VStack{
                Text("Step 4/5").foregroundColor(.white).font(.custom("ND Astroneer", size: 50))
                Text("How often do you exercise?").foregroundColor(.white).font(.custom("ND Astroneer", size: 18)).padding(50)
                VStack(spacing:18){
                    Button(action: {
                       
                        color = 1
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 1 ? Color("be") : .white))
                            VStack{
                                Text("Newbie").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24))
                                Text("Just getting started").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 18))
                            }
                        }
                    })
                    Button(action: {
                       
                        color = 2
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 2 ? Color("be") : .white))
                            VStack{
                                Text("Keep on").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24))
                                Text("1-2 times a week").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 18))
                            }
                        }
                    })
                    Button(action: {
                       
                        color = 3
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 3 ? Color("be") : .white))
                            VStack{
                                Text("Advanced").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24))
                                Text("More than 3 times a week").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 18))
                            }
                        }
                    })
                    Button(action: {
                        if color != 0{
                        transition = 6
                        color = 4
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 4 ? Color("be") : .white))
                           
                                Text("Next").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24))
                            
                        }
                    }).padding(.top,70)
                   
                }
                Spacer()
            }.offset( y: 200)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct StepFour_Previews: PreviewProvider {
    static var previews: some View {
        StepFour(transition: .constant(1))
    }
}
