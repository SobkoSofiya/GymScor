//
//  Lessons.swift
//  GymScor
//
//  Created by Sofi on 10.03.2021.
//

import SwiftUI
import YouTubePlayer
struct Lessons: View {
    @StateObject var model = ViewModel()
    @State var selection = 1
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("l"), Color("t")]), startPoint: .leading
                                           , endPoint: .trailing))
            VStack(spacing:0){
                Text("Lessons").foregroundColor(.white).font(.custom("ND Astroneer", size: 24)).padding(.bottom)
                HStack(spacing:0){
                    Button(action: {
                        selection = 1
                    }, label: {
                        ZStack{
                            Rectangle().strokeBorder(Color("te") )
                                .frame(width: UIScreen.main.bounds.width/4, height: 37, alignment: .center)
                                .foregroundColor(.clear)
                                .background(Rectangle().foregroundColor(selection == 1 ? Color("te") : .white))
                            Text("Hands").foregroundColor(selection == 1 ?  .white : Color("te")).font(.custom("ND Astroneer", size: 18))
                        }
                    })
                    Button(action: {
                        selection = 2
                    }, label: {
                        ZStack{
                            Rectangle().strokeBorder(Color("te") )
                                .frame(width: UIScreen.main.bounds.width/4, height: 37, alignment: .center)
                                .foregroundColor(.clear)
                                .background(Rectangle().foregroundColor(selection == 2 ? Color("te") : .white))
                            Text("Spine").foregroundColor(selection == 2 ?  .white : Color("te")).font(.custom("ND Astroneer", size: 18))
                        }
                    })
                    Button(action: {
                        selection = 3
                    }, label: {
                        ZStack{
                            Rectangle().strokeBorder(Color("te") )
                                .frame(width: UIScreen.main.bounds.width/4, height: 37, alignment: .center)
                                .foregroundColor(.clear)
                                .background(Rectangle().foregroundColor(selection == 3 ? Color("te") : .white))
                            Text("Torso").foregroundColor(selection == 3 ?  .white : Color("te")).font(.custom("ND Astroneer", size: 18))
                        }
                    })
                    Button(action: {
                        selection = 4
                    }, label: {
                        ZStack{
                            Rectangle().strokeBorder(Color("te") )
                                .frame(width: UIScreen.main.bounds.width/4, height: 37, alignment: .center)
                                .foregroundColor(.clear)
                                .background(Rectangle().foregroundColor(selection == 4 ? Color("te") : .white))
                            Text("Legs").foregroundColor(selection == 4 ?  .white : Color("te")).font(.custom("ND Astroneer", size: 18))
                        }
                    })
                  
                    
                }
                TabView(selection:$selection){
                    
                    Hand(modelLesson: $model.modelLessons).tag(1)
                    Spine(modelLesson: $model.modelLessons).tag(2)
                    Torso(modelLesson: $model.modelLessons).tag(3)
                    Legs(modelLesson: $model.modelLessons).tag(4)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                Spacer()
            }.offset( y: 50)
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            model.GetLessons()
        })
    }
}

struct Lessons_Previews: PreviewProvider {
    static var previews: some View {
        Lessons()
    }
}
struct Hand:View {
    @Binding var modelLesson:[ModelLessons]
    var body: some View{
        ZStack{
            Color.white
            Text("Подождите немного").foregroundColor( Color("te")).font(.custom("ND Astroneer", size: 18))
        ScrollView{
            
            VStack(spacing:20){
                ForEach(modelLesson, id:\.self){ i in
                    if i.category == "hands"{
                        Video(urlString: i.url).frame(width: UIScreen.main.bounds.width-40, height: 300, alignment: .center)
                    }
                }
            }
        }.padding(.bottom,110)
        }
    }
}

struct Spine:View {
    @Binding var modelLesson:[ModelLessons]
    var body: some View{
        ZStack{
            Color.white
            Text("Подождите немного").foregroundColor( Color("te")).font(.custom("ND Astroneer", size: 18))
        ScrollView{
            
            VStack(spacing:20){
                ForEach(modelLesson, id:\.self){ i in
                    if i.category == "spine"{
                        Video(urlString: i.url).frame(width: UIScreen.main.bounds.width-40, height: 300, alignment: .center)
                    }
                }
            }
        }.padding(.bottom,110)
        }
    }
}
struct Torso:View {
    @Binding var modelLesson:[ModelLessons]
    var body: some View{
        ZStack{
            Color.white
            Text("Подождите немного").foregroundColor( Color("te")).font(.custom("ND Astroneer", size: 18))
        ScrollView{
            
            VStack(spacing:20){
                ForEach(modelLesson, id:\.self){ i in
                    if i.category == "torso"{
                        Video(urlString: i.url).frame(width: UIScreen.main.bounds.width-40, height: 300, alignment: .center)
                    }
                }
            }
        }.padding(.bottom,110)
        }
    }
}
struct Legs:View {
    @Binding var modelLesson:[ModelLessons]
    var body: some View{
        ZStack{
            Color.white
            Text("Подождите немного").foregroundColor( Color("te")).font(.custom("ND Astroneer", size: 18))
        ScrollView{
            
            VStack(spacing:20){
                ForEach(modelLesson, id:\.self){ i in
                    if i.category == "legs"{
                        Video(urlString: i.url).frame(width: UIScreen.main.bounds.width-40, height: 300, alignment: .center)
                    }
                }
            }
        }.padding(.bottom,110)
        }
    }
}


struct Video:UIViewControllerRepresentable {
    @State var urlString:String
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<Video>) {
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Video>) ->  UIViewController {
        let controller = UIViewController()
        let url = URL(string: urlString)
        let VideoController = YouTubePlayerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-40, height: 300 ))
        VideoController.loadVideoURL(url!)
        controller.view.addSubview(VideoController)
        return controller
    }
}
