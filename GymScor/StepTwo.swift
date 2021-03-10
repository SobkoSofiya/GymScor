//
//  StepTwo.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct StepTwo: View {
    @Binding var transition:Int
    @State var color = 0
    var body: some View {
        ZStack{
            Color("for")
            VStack{
                Text("Step 2/5").foregroundColor(.white).font(.custom("ND Astroneer", size: 50))
                Text("What is your gender?").foregroundColor(.white).font(.custom("ND Astroneer", size: 18)).padding(50)
                HStack(spacing:100){
                    VStack(spacing:27){
                    Button(action: {
                        
                        color = 1
                    }, label: {
                        ZStack{
                            Circle().strokeBorder(Color.black ).frame(width: 92, height: 92, alignment: .center).foregroundColor(.clear).background( Circle().foregroundColor(color == 1 ? Color("be") : .white))
                            Image("w").offset(x: -2)
                        }
                    })
                        Text("Female").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
                    }
                    VStack(spacing:27){
                    Button(action: {
                        
                        color = 2
                    }, label: {
                        ZStack{
                            Circle().strokeBorder(Color.black ).frame(width: 92, height: 92, alignment: .center).foregroundColor(.clear).background( Circle().foregroundColor(color == 2 ? Color("be") : .white))
                            Image("m").offset(y:-10)
                        }
                    })
                    
                    Text("Male").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
                }
                }
                Button(action: {
                    if color == 2 {
                    transition = 3
                    color = 3
                    } else if color == 1{
                        transition = 4
                        color = 3
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 2 || color == 1 ? Color("be") : .white))
                       
                        Text("Next").foregroundColor( color == 1 || color == 2 ? .white : Color("te")).font(.custom("ND Astroneer", size: 24)).padding(19)
                        
                    }
                }).padding(.top, 150)
                Spacer()
            }.offset( y: 200)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct StepTwo_Previews: PreviewProvider {
    static var previews: some View {
        StepTwo(transition: .constant(1))
    }
}
