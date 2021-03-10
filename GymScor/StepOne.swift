//
//  StepOne.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct StepOne: View {
    @Binding var transition:Int
    @State var color = 0
    var body: some View {
        ZStack{
            Color("for")
            VStack{
                Text("Step 1/5").foregroundColor(.white).font(.custom("ND Astroneer", size: 50))
                Text("What is your purpose?").foregroundColor(.white).font(.custom("ND Astroneer", size: 18)).padding(50)
                VStack{
                    Button(action: {
                        transition = 2
                        color = 1
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 1 ? Color("be") : .white))
                            HStack{
                                Image("im1")
                                Text("Weight loss").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24)).padding()
                            }
                        }
                    })
                    Button(action: {
                        transition = 2
                        color = 2
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 2 ? Color("be") : .white))
                            HStack{
                                Image("im2")
                                Text("Keeping fit").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24)).padding(19)
                            }
                        }
                    })
                    Button(action: {
                        transition = 2
                        color = 3
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 3 ? Color("be") : .white))
                            HStack{
                                Image("im3")
                                Text("Build muscle").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24)).padding(7)
                            }
                        }
                    })
                   
                }
                Spacer()
            }.offset( y: 200)
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct StepOne_Previews: PreviewProvider {
    static var previews: some View {
        StepOne(transition: .constant(1))
    }
}
