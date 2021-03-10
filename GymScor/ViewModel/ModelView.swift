//
//  ModelView.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON


class ViewModel: ObservableObject {
    @Published var model:[Model] = []
    @Published var heightUserDefaults = UserDefaults.standard.string(forKey: "height")
    @Published var weightUserDefaults = UserDefaults.standard.string(forKey: "weight")
    
    func signUp(email:String, password:String, name:String) {
        let url = "http://gym.areas.su/signup?username=\(name)&email=\(email)&password=\(password)&weight=\(weightUserDefaults!)&height=\(heightUserDefaults!)"
        AF.request(url, method: .post).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                model.append(Model(name: name, password: password, email: email, height: heightUserDefaults!, weight: weightUserDefaults!))
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    func signIn(password:String, name:String, con:((_ result:String, _ error:String) -> Void)? = nil) {
        let url = "http://gym.areas.su//signin?username=\(name)&password=\(password)"
        AF.request(url, method: .post).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let token = json["notice"]["token"].stringValue
                let error = json["notice"]["answer"].stringValue
                UserDefaults.standard.set(token, forKey: "token")
             con!(token, error)
                print("JSON: \(json)")
            case .failure(let error):
                con!("", error.localizedDescription)
                print(error)
            }
        }
    }
    func signOut(name:String) {
        let url = "http://gym.areas.su/signout?username=\(name)"
        AF.request(url, method: .post).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
              
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
             
                print(error)
            }
        }
    }
}
