//
//  Torso.swift
//  GymScor
//
//  Created by Sofi on 11.03.2021.
//

import SwiftUI

struct TorsoSit: View {
    let colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var days = 0
    @State var message = ""
    @State var error = false
    @State var dayTorso = UserDefaults.standard.integer(forKey: "dayTorso")
    @Binding var transitionTren:Int
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("l"), Color("t")]), startPoint: .leading
                                           , endPoint: .trailing))
            VStack{
                Text("Sit-up").foregroundColor(.white).font(.custom("ND Astroneer", size: 24)).padding(.bottom)
                ZStack(alignment:.top){
                    Color.white
                    VStack{
                        LazyVGrid(columns: colums, spacing:15){
                            ForEach(1..<61){ i in
                            
                                Button(action: {
                                    if days+1 == i{
                                       
                                        days  = days+1
                                        UserDefaults.standard.set(days, forKey: "dayTorso")
                                        transitionTren = 5
                                        print(days)
                                    } else if i > days+1{
                                       message = "Вы еще не дошли до этого дня"
                                        error.toggle()
                                    } else if i < days+1{
                                        message = "Вы прошли этот день"
                                         error.toggle()
                                    }
                                }, label: {
                                    ZStack{
                                        Circle().strokeBorder(Color("te") ).foregroundColor(.clear).background(Circle().foregroundColor( days+1 > i ? Color("te") : .white)).frame(width: 42, height: 42, alignment: .center)
                                        Text("\(i)").foregroundColor(days+1 > i ? .white : Color("te")).font(.custom("ND Astroneer", size: 24))
                                    }
                                }).alert(isPresented: $error, content: {
                                    Alert(title: Text("Error"), message: Text("\(message)"), dismissButton: .default(Text("Ok")))
                                })
                           
                            
                            }
                            
                        }.padding(.horizontal,30)
                        ZStack{
                        ZStack(alignment:.leading){
                            RoundedRectangle(cornerRadius: 23.0).strokeBorder(Color("te") ).frame(width: 340, height: 45, alignment: .center)
                                .foregroundColor(.clear)
                            RoundedRectangle(cornerRadius: 23.0).frame(width: days <= 9 ? 51 : 340/60*CGFloat(days), height: 45, alignment: .center)
                                .foregroundColor(Color("te"))
                            
                           
                        }
                            Text("\(Int(CGFloat(Double(1.66666667)*Double(days))))%").foregroundColor(days <= 32 ? Color("te") : .white).font(.custom("ND Astroneer", size: 20))
                        }.padding(20)
                    }.padding(.top)
                }
                
                Spacer()
            }.offset( y: 60)
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            days = dayTorso
        })
    }
}

struct Torso_Previews: PreviewProvider {
    static var previews: some View {
        TorsoSit( transitionTren: .constant(1))
    }
}
