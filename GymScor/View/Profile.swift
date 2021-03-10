//
//  Profile.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct Profile: View {
    @Binding var transition:Int
    @StateObject var model = ViewModel()
    @State var list = ["Training rest", "Notifications","Biometric","Start dialog","Privacy policy"]
    @State var toggle = false
    @State var showWeb = false
    @State var name = UserDefaults.standard.string(forKey: "name")
    @State var weight = ""
    @State var height = ""
    @State var heightUserDefaults = UserDefaults.standard.string(forKey: "height")
    @State var weightUserDefaults = UserDefaults.standard.string(forKey: "weight")
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("l"), Color("t")]), startPoint: .leading
                                           , endPoint: .trailing))
            VStack{
                HStack(alignment:.bottom, spacing:80){
                    VStack(spacing:5){
                        Text("\(weightUserDefaults!)").foregroundColor(.white).font(.custom("ND Astroneer", size: 14))
                        Text("Weight").foregroundColor(.white).font(.custom("ND Astroneer", size: 14))
                        
                    }
                    VStack(spacing:5){
                        Text("\(name!)").foregroundColor(.white).font(.custom("ND Astroneer", size: 24))
                        Text("Male").foregroundColor(.white).font(.custom("ND Astroneer", size: 16))
                        
                    }
                    VStack(spacing:5){
                        Text("\(heightUserDefaults!)").foregroundColor(.white).font(.custom("ND Astroneer", size: 14))
                        Text("Height").foregroundColor(.white).font(.custom("ND Astroneer", size: 14))
                        
                    }
                }
                ZStack{
                    Color.white
                    List{
                        ForEach(list, id:\.self){ i in
                            Button(action: {
                                if i == "Biometric"{
                                    customAlert()
                                }
                                if i == "Start dialog"{
                                    UserDefaults.standard.set(false, forKey: "show")
                                    transition = 7
                                    model.signOut(name: name!)

                                }
                                if i == "Privacy policy"{
                                    showWeb.toggle()
                                }
                            }, label: {
                                VStack(alignment:.leading, spacing:0){
                                    HStack{
                                    Text(i).foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 17))
                                        Spacer()
                                        if i == "Training rest"{
                                            Text("30 sec").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 17))
                                        }
                                        if i == "Notifications"{
                                            Toggle(isOn: $toggle){
                                                
                                            }.toggleStyle(ToggleCustom())
                                        }
                                    }
//                                    Divider()
//                                        .frame(width: UIScreen.main.bounds.width, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                            })
                        }
                    }
                }
                Spacer()
            }.offset( y: 60)
            if showWeb{
                Web(showWeb:$showWeb)
            }
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            model.GetProfile()
        })
        
    }
    func customAlert() {
        let alert = UIAlertController(title: "Biometric", message: "Please, Input Your Biometric Data", preferredStyle: .alert)
         
        alert.addTextField { (value) in
            value.placeholder = "Weight"
            value.isSecureTextEntry = false
        }
        alert.addTextField { (value) in
            value.placeholder = "Height"
            value.isSecureTextEntry = false
        }
        
        
        let okey = UIAlertAction(title: "Okey", style: .default){( _ )in
            weight = alert.textFields![0].text!
            height = alert.textFields![1].text!
            model.ChangeProfile(weight: weight, height: height)
            UserDefaults.standard.set(weight, forKey: "weight")
            UserDefaults.standard.set(height, forKey: "height")
            heightUserDefaults = UserDefaults.standard.string(forKey: "height")
           weightUserDefaults = UserDefaults.standard.string(forKey: "weight")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (_) in
            
        }
        alert.addAction(cancel)
        alert.addAction(okey)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            
        })
    }
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(transition: .constant(1))
    }
}



struct ToggleCustom:ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack{
            configuration.label
            ZStack(alignment: configuration.isOn ? .trailing : .leading){
                RoundedRectangle(cornerRadius: 25).frame(width: 34, height: 14, alignment: .center).foregroundColor(Color("te").opacity(0.2))
                Circle()
                    .frame(width: 20, height: 20, alignment: .center).foregroundColor(Color("te"))
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                    }
                    
            }
        }
    }
}
