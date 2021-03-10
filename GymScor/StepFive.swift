//
//  StepFive.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct StepFive: View {
    @Binding var transition:Int
    @State var color = 0
    @State var height = ""
    @State var weight = ""
    @State var show = UserDefaults.standard.bool(forKey: "show")
    @State var heightUserDefaults = UserDefaults.standard.string(forKey: "height")
    @State var weightUserDefaults = UserDefaults.standard.string(forKey: "weight")
    var body: some View {
        ZStack{
            Color("for")
            VStack{
                Text("Step 5/5").foregroundColor(.white).font(.custom("ND Astroneer", size: 50))
                Text("What’s your height and weight?").foregroundColor(.white).font(.custom("ND Astroneer", size: 18)).padding(50)
                VStack(spacing:18){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                        CustomTextFieldHeight(height: $height, placeholder: Text("Height"))
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                        CustomTextFieldWeight(weight: $weight, placeholder: Text("Weight"))
                    }
                   
                    Button(action: {
                        if weight != "" && height != ""{
                        transition = 7
                        color = 4
                            UserDefaults.standard.set(true, forKey: "show")
                            UserDefaults.standard.set(height, forKey: "height")
                            UserDefaults.standard.set(weight, forKey: "weight")
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 39).strokeBorder(Color.black ).frame(width: 284, height: 77, alignment: .center).foregroundColor(.clear).background(RoundedRectangle(cornerRadius: 39).foregroundColor(color == 4 ? Color("be") : .white))
                           
                                Text("Next").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24))
                            
                        }
                    }).padding(.top,190)
                   
                }
                Spacer()
            }.offset( y: 200)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct StepFive_Previews: PreviewProvider {
    static var previews: some View {
        StepFive(transition: .constant(1))
    }
}


struct CustomTextFieldHeight:View {
    @Binding var height:String
    @State var placeholder:Text
    @State var edit :(Bool) -> () = {_ in}
    @State var commit :() -> () = {}
    var body: some View{
        ZStack(alignment:.leading){
            if height.isEmpty{
                placeholder.foregroundColor(Color("gr")).font(.custom("ND Astroneer", size: 24))
            }
            TextField("", text: $height, onEditingChanged: edit, onCommit: commit).frame(width: 270, height: 50, alignment: .center)
        }
    }
}

struct CustomTextFieldWeight:View {
    @Binding var weight:String
    @State var placeholder:Text
    @State var edit :(Bool) -> () = {_ in}
    @State var commit :() -> () = {}
    var body: some View{
        ZStack(alignment:.leading){
            if weight.isEmpty{
                placeholder.foregroundColor(Color("gr")).font(.custom("ND Astroneer", size: 24))
            }
            TextField("", text: $weight, onEditingChanged: edit, onCommit: commit).frame(width: 270, height: 50, alignment: .center)
        }
    }
}
