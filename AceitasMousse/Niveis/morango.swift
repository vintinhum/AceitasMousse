//
//  morango.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 26/02/21.
//

import SwiftUI

struct morango: View {
    
    @State private var scale: CGFloat = 1
    @State private var numberOfTouches: Int = 0
    @State var fruta: String = "morango"
//    @State var botao: String = ""
    
    @State public var currentDate: CGFloat = 0
    @State public var bgColor = Color.init(.cyan)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(bgColor)
                .edgesIgnoringSafeArea(.all)
                .onReceive(timer) { input in
                    
                    if currentDate == 2 {
                        currentDate = 0
                    }
                    else {
                        currentDate += 1
                    }
                    
                    updateColor()
                }
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                
                

//            Button(action: {
//                print("tocou no botao")
//            }, label: {
//                Image("\(botao)")
//                    .resizable()
//                    .frame(width: 227, height: 81, alignment: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
//                    .position()
//
//            })
            
            Button(action: {
                
                if numberOfTouches <= 6 {
                    scale += scale * 0.5
                    numberOfTouches += 1
//                    botao = ""
                }
                else {
                    fruta = ""
                        
//                    botao = "botao"
                }
                
            }, label: {
                Image("\(fruta)")
                    .resizable()
                    .frame(width: 62.5263157, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .scaleEffect(scale)
            .animation(.easeInOut)
            
            
        }
    }
    
    func updateColor() {
        if self.currentDate == 0 {
            self.bgColor = Color.init(.cyan)
        }
        else {
            self.bgColor = Color.init(.yellow)
        }
        
    }
}

struct morango_Previews: PreviewProvider {
    static var previews: some View {
        morango()
    }
}
