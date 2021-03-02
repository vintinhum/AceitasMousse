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
    
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                
                .foregroundColor(.blue)
            
            
                
                
                
            Button(action: {
                
                if numberOfTouches <= 6 {
                    scale += scale * 0.5
                    numberOfTouches += 1
                }
                else {
                    fruta = ""
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
}

struct morango_Previews: PreviewProvider {
    static var previews: some View {
        morango()
    }
}
