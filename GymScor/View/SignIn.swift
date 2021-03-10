//
//  SignIn.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct SignIn: View {
    @State var name = ""
    @State var password = ""
    @Binding var transition:Int
    @State var errorAlert = false
    @State var message = ""
    @StateObject var model = ViewModel()
    @State var show = UserDefaults.standard.bool(forKey: "show")
    var body: some View {
        ZStack{
            Color("for")
            VStack{
                Image("icc")
                VStack{
                    Text("Home\n Gym").foregroundColor(.white).font(.custom("ND Astroneer", size: 50))
                    VStack(spacing:18){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                        HStack(spacing:0){
                            Image("pro").padding()
                            Divider().frame(width: 1, height: 50, alignment: .center)
                            CustomTextFieldName(name: $name, placeholder: Text("Ivanov")).padding(.leading,10)
                            
                        }
                    }.frame(width: 312, height: 50, alignment: .center)
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                        HStack(spacing:0){
                            Image("z").padding()
                            Divider().frame(width: 1, height: 50, alignment: .center)
                            CustomTextFieldPassword(password: $password, placeholder: Text("●●●●●●")).padding(.leading,10)
                            
                        }
                    }.frame(width: 312, height: 50, alignment: .center)
                    }
                    Button(action: {
                        if name != "" && password != "" {
                            model.signIn(password: password, name: name){ token, error in
                                if token != "" || error == "Success"{
                                    transition = 3
                                    UserDefaults.standard.set(name, forKey: "name")
                                
                                }else{
                                    errorAlert.toggle()
                                    message = error
                                }
                        }
                        }else{
                            errorAlert.toggle()
                            message = "Enter all fields"
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                            Text("Sign In").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24))
                        }
                    }).padding(.top,40).alert(isPresented: $errorAlert, content: {
                        Alert(title: Text("Error"), message: Text("\(message)"), dismissButton: .default(Text("Ok")))
                    })
                    Button(action: {
                        transition = 2
                    }, label: {
                        VStack(spacing:0){
                           
                            Text("Sign Up").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
                            Rectangle()
                                .frame(width: 74, height: 1, alignment: .center).foregroundColor(.white)
                        }
                    })
                    Button(action: {}, label: {
                        VStack(spacing:0){
                           
                            Text("Skip").foregroundColor(.white).font(.custom("ND Astroneer", size: 16))
                            Rectangle()
                                .frame(width: 30, height: 1, alignment: .center).foregroundColor(.white)
                        }
                    }).padding(.top,140)
                }.offset( y: -70)
                
                Spacer()
                
            }.offset( y:    150)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn(transition: .constant(1))
    }
}


struct CustomTextFieldName:View {
    @Binding var name:String
    @State var placeholder:Text
    @State var edit :(Bool) -> () = {_ in}
    @State var commit :() -> () = {}
    var body: some View{
        ZStack(alignment:.leading){
            if name.isEmpty{
                placeholder.foregroundColor(Color("gr")).font(.custom("ND Astroneer", size: 24))
            }
            TextField("", text: $name, onEditingChanged: edit, onCommit: commit).frame(width: 250, height: 50, alignment: .center)
        }
    }
}


struct CustomTextFieldPassword:View {
    @Binding var password:String
    @State var placeholder:Text
    @State var edit :(Bool) -> () = {_ in}
    @State var commit :() -> () = {}
    var body: some View{
        ZStack(alignment:.leading){
            if password.isEmpty{
                placeholder.foregroundColor(Color("gr")).font(.custom("ND Astroneer", size: 18))
            }
            TextField("", text: $password, onEditingChanged: edit, onCommit: commit).frame(width: 250, height: 50, alignment: .center)
        }
    }
}
