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
    @State public var currentDate = 0
    @State public var bgColor = Color.purple
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var wrongAttempt: Bool = false
    
    var body: some View {
    
        ZStack {
            Rectangle()
                .foregroundColor(bgColor)
                .edgesIgnoringSafeArea(.all)
                .onReceive(timer) { input in
                    
                    if currentDate == 1 {
                        currentDate = 0
                    }
                    else {
                        currentDate += 1
                    }
                    
                    updateColor()
                }
                .animation(.linear(duration: 0.3))
                .onTapGesture {
                    print("tocou errado")
                    self.wrongAttempt.toggle()
                    
                }

            Image("limao")
                .resizable()
                .frame(width: 358, height: 358, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: wrongAttempt ? -10 : 0)
                .animation(Animation.default.repeatCount(5).speed(7))
                .scaleEffect(setZoom(mag: self.mag))
                .animation(nil)
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
                       //Passar de níve;
                    }
            }
                
        }
        
    }
    
    func setZoom(mag: CGFloat) -> CGFloat{
        return max(min(self.limaoScale*mag, self.limaoMaxScale), self.limaoMinScale)
    }
    
    func updateColor() {
            if self.currentDate == 0 {
                self.bgColor = .red
            }
            else {
                self.bgColor = .orange
            }
        }

}

struct limao_Previews: PreviewProvider {
    static var previews: some View {
        limao()
            .previewDevice("iPhone 11")
    }
}
