//
//  Model.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import Foundation
import SwiftUI


struct Model:Hashable {
    let name, password, email, height, weight:String
}


struct ModelLessons:Hashable {
    let category, url:String
}
