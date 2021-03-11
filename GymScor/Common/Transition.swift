//
//  Transition.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI

struct TransitionTren:View {
  
    @State var transitionTren  = 1
    var body: some View{
        if transitionTren == 1{
            Main(transitionTren: $transitionTren)
            
        } else if transitionTren == 2{
            PushUp( transitionTren: $transitionTren)
        }else if transitionTren == 3{
            PushUpTwo(transitionTren: $transitionTren)
        }  else if transitionTren == 4{
            TorsoSit(transitionTren: $transitionTren)
        }else if transitionTren == 5{
            TorsoTwo(transitionTren: $transitionTren)
        }else if transitionTren == 6{
            TorsoSuccess(transitionTren: $transitionTren)
        }else if transitionTren == 7{
            PushUpSuccess(transitionTren: $transitionTren)
        }else if transitionTren == 8{
            PushUpTwo(transitionTren: $transitionTren)
        }else if transitionTren == 9{
            PushUpTwo(transitionTren: $transitionTren)
        }
    }
}

struct Transition: View {
    @State var transition = 1
    @State var show = UserDefaults.standard.bool(forKey: "show")
    var body: some View {
        if show{
            if transition == 1{
                SignIn(transition: $transition)
            }else if transition == 2 {
                SignUp(transition: $transition)
            } else if transition == 3 {
                BottomMenu(transition: $transition)
            } else if transition == 7 {
                Transition()
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
            Transition()
        }else if transition == 8 {
            SignUp(transition: $transition)
        }else if transition == 9 {
            Back(transition: $transition)
        }
        }
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition()
    }
}
