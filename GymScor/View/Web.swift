//
//  Web.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//
import Foundation
import SwiftUI
import WebKit
struct Web: View {
    @Binding var showWeb:Bool
    var body: some View {
        ZStack{
            Color.white
           
            VStack{
            Button(action: {
                showWeb.toggle()
            }, label: {
                Text("Back").foregroundColor(Color("te")).font(.custom("ND Astroneer", size: 30))
            })
            WebShow()
            }.offset( y: 120)
            
        }
    }
}

//struct Web_Previews: PreviewProvider {
//    static var previews: some View {
//        Web()
//    }
//}


struct WebShow:UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let controller = WKWebView()
        guard let url = URL(string: "http://dailyworkoutapps.com/privacy-policy.html") else {
            return WKWebView()
        }
        let req = URLRequest(url: url)
        controller.load(req)
        return controller
        
       
    }
    func updateUIView(_ uiViewController: WebShow.UIViewType, context: Context) {
        
    }
}
