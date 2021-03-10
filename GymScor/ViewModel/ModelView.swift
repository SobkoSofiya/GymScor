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
    @Published var modelLessons:[ModelLessons] = []
    @Published var heightUserDefaults = UserDefaults.standard.string(forKey: "height")
    @Published var weightUserDefaults = UserDefaults.standard.string(forKey: "weight")
    @Published var token = UserDefaults.standard.string(forKey: "token")
    
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
    func signIn(password:String, name:String, complitionHandler:((_ result:String, _ error:String) -> Void)? = nil) {
        let url = "http://gym.areas.su//signin?username=\(name)&password=\(password)"
        AF.request(url, method: .post).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let token = json["notice"]["token"].stringValue
                let error = json["notice"]["answer"].stringValue
                UserDefaults.standard.set(token, forKey: "token")
                complitionHandler!(token, error)
                print("JSON: \(json)")
            case .failure(let error):
                complitionHandler!("", error.localizedDescription)
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
    
    
    func GetLessons()     {
        let url = "http://gym.areas.su//lessons"
        AF.request(url, method: .get).validate().responseJSON {[self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for i in 0..<json.count{
                    modelLessons.append(ModelLessons(category: json[i]["category"].stringValue, url: json[i]["url"].stringValue))
                }
             
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    func ChangeProfile(weight:String, height:String)  {
        let url = "http://gym.areas.su/editeprofile?token=\(token!)&weight=\(weight)&height=\(height)"
        AF.request(url, method: .put).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    func GetProfile()  {
        let url = "http://gym.areas.su/profile?token=\(token!)"
        AF.request(url, method: .put).validate().responseJSON { response in
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
//http://gym.areas.su/editeprofile ?token=765080&weight=40&height
