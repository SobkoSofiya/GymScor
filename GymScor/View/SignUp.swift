//
//  SignUp.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct SignUp: View {
    @State var nameSignUp = ""
    @State var passwordSignUp = ""
    @State var repasswordSignUp = ""
    @State var emailSignUp = ""
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
                            CustomTextFieldNameSignUp(nameSignUp: $nameSignUp, placeholder: Text("Invanov")).padding(.leading,10)
                            
                        }
                    }.frame(width: 312, height: 50, alignment: .center)
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                            HStack(spacing:0){
                                Image("em").padding()
                                Divider().frame(width: 1, height: 50, alignment: .center)
                                CustomTextFieldemailSignUp(emailSignUp: $emailSignUp, placeholder: Text("Ivanov@mail.com")).padding(.leading,10)
                                
                            }
                        }.frame(width: 312, height: 50, alignment: .center)
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                        HStack(spacing:0){
                            Image("z").padding()
                            Divider().frame(width: 1, height: 50, alignment: .center)
                            CustomTextFieldPasswordSignUp(passwordSignUp: $passwordSignUp, placeholder: Text("●●●●●●")).padding(.leading,10)
                            
                        }
                    }.frame(width: 312, height: 50, alignment: .center)
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                            HStack(spacing:0){
                                Image("z").padding()
                                Divider().frame(width: 1, height: 50, alignment: .center)
                                CustomTextFieldRePasswordSignUp(repasswordSignUp: $repasswordSignUp, placeholder: Text("●●●●●●")).padding(.leading,10)
                                
                            }
                        }.frame(width: 312, height: 50, alignment: .center)
                    }
                    Button(action: {
                        if nameSignUp != "" && passwordSignUp != "" && repasswordSignUp != "" && emailSignUp != ""{
                            if repasswordSignUp == passwordSignUp {
                                if emailSignUp.contains("@"){
                                    model.signUp(email: emailSignUp, password: passwordSignUp, name: nameSignUp)
                                    transition = 1
                                }else{
                                    errorAlert.toggle()
                                    message = "Incorrect email"
                                }
                            } else{
                                errorAlert.toggle()
                                message = "Password do not match"
                            }
                        } else{
                            errorAlert.toggle()
                            message = "Enter all fields"
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 312, height: 50, alignment: .center).foregroundColor(.white)
                            Text("Sign Up").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 24))
                        }
                    }).padding(.top,60).alert(isPresented: $errorAlert, content: {
                        Alert(title: Text("Error"), message: Text("\(message)"), dismissButton: .default(Text("Ok")))
                    })
                   
                    Button(action: {
                        transition = 1
                    }, label: {
                        VStack(spacing:0){
                           
                            Text("Back").foregroundColor(.white).font(.custom("ND Astroneer", size: 16))
                            Rectangle()
                                .frame(width: 30, height: 1, alignment: .center).foregroundColor(.white)
                        }
                    }).padding(.top,100)
                }.offset( y: -70)
                
                Spacer()
                
            }.offset( y:    50)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp( transition: .constant(1))
    }
}


struct CustomTextFieldNameSignUp:View {
    @Binding var nameSignUp:String
    @State var placeholder:Text
    @State var edit :(Bool) -> () = {_ in}
    @State var commit :() -> () = {}
    var body: some View{
        ZStack(alignment:.leading){
            if nameSignUp.isEmpty{
                placeholder.foregroundColor(Color("gr")).font(.custom("ND Astroneer", size: 24))
            }
            TextField("", text: $nameSignUp, onEditingChanged: edit, onCommit: commit).accessibilityIdentifier("name1").frame(width: 250, height: 50, alignment: .center).accessibilityIdentifier("name1")
        }
    }
}
struct CustomTextFieldPasswordSignUp:View {
    @Binding var passwordSignUp:String
    @State var placeholder:Text
    @State var edit :(Bool) -> () = {_ in}
    @State var commit :() -> () = {}
    var body: some View{
        ZStack(alignment:.leading){
            if passwordSignUp.isEmpty{
                placeholder.foregroundColor(Color("gr")).font(.custom("ND Astroneer", size: 24))
            }
            TextField("", text: $passwordSignUp, onEditingChanged: edit, onCommit: commit).frame(width: 250, height: 50, alignment: .center).accessibilityIdentifier("pass1")
        }
    }
}
struct CustomTextFieldRePasswordSignUp:View {
    @Binding var repasswordSignUp:String
    @State var placeholder:Text
    @State var edit :(Bool) -> () = {_ in}
    @State var commit :() -> () = {}
    var body: some View{
        ZStack(alignment:.leading){
            if repasswordSignUp.isEmpty{
                placeholder.foregroundColor(Color("gr")).font(.custom("ND Astroneer", size: 24))
            }
            TextField("", text: $repasswordSignUp, onEditingChanged: edit, onCommit: commit).frame(width: 250, height: 50, alignment: .center).accessibilityIdentifier("repass")
        }
    }
}
struct CustomTextFieldemailSignUp:View {
    @Binding var emailSignUp:String
    @State var placeholder:Text
    @State var edit :(Bool) -> () = {_ in}
    @State var commit :() -> () = {}
    var body: some View{
        ZStack(alignment:.leading){
            if emailSignUp.isEmpty{
                placeholder.foregroundColor(Color("gr")).font(.custom("ND Astroneer", size: 24))
            }
            TextField("", text: $emailSignUp, onEditingChanged: edit, onCommit: commit).frame(width: 250, height: 50, alignment: .center).accessibilityIdentifier("email")
        }
    }
}
