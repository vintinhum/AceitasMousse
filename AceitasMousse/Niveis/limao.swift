//
//  limao.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 26/02/21.
//

import SwiftUI

struct limao: View {
    @State var limaoScale: CGFloat = 20
    let limaoMaxScale: CGFloat = 20
    let limaoMinScale: CGFloat = 0.5
    @State var lastScaleValue: CGFloat = 1.0
    @GestureState var mag: CGFloat = 1.0
    
    var body: some View {
        Image("limao")
            .resizable()
            .frame(width: 358, height: 358, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .scaleEffect(setZoom(mag: self.mag))
            .gesture(
                MagnificationGesture()
                        .updating($mag, body: {(value,state, _) in
                                state = value
                        
                        })
                        .onEnded({value in
                            self.limaoScale = setZoom(mag: value)
                        })
                
            )
        
            .onTapGesture {
                if(limaoScale==limaoMinScale){
                    print("toquei")

                }
            }
    }
    
    func setZoom(mag: CGFloat) -> CGFloat{
        return max(min(self.limaoScale*mag, self.limaoMaxScale), self.limaoMinScale)
    }
}

struct limao_Previews: PreviewProvider {
    static var previews: some View {
        limao()
            .previewDevice("iPhone 11")
    }
}
