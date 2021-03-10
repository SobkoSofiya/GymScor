//
//  Transition.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct Transition: View {
    @State var transition = 1
    @State var show = UserDefaults.standard.bool(forKey: "show")
    var body: some View {
        if show{
            if transition == 1{
                SignIn(transition: $transition)
            }
        } else{
        if transition == 1{
            StepOne(transition: $transition)
        } else if transition == 2 {
            StepTwo(transition: $transition)
        }else if transition == 3 {
            StepThree(transition: $transition)
        }
        else if transition == 4 {
            StepThreeWomen(transition: $transition)
        }else if transition == 5 {
            StepFour(transition: $transition)
        }
        else if transition == 6 {
            StepFive(transition: $transition)
        }else if transition == 7 {
            SignIn(transition: $transition)
        }
        }
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition()
    }
}
