//
//  Onboarding5.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct Onboarding5: View {
    @State var limaoScale: CGFloat = 1
    let limaoMaxScale: CGFloat = 1.8
    let limaoMinScale: CGFloat = 0.5
    @State var lastScaleValue: CGFloat = 1.0
    @GestureState var mag: CGFloat = 1.0
    @State var locked = false
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
            VStack{
                HStack {
                    Spacer()
                    
                    Text("e podem mudar de tamanho")
                        .font(.custom("Ygro Sans Beta Medium", size: 25))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 50)

                    
                    
                    
                    
                    Spacer()
                    
                }
                .background(
                    Rectangle()
                        .foregroundColor(Color.init(red: 100/255, green: 142/255, blue: 79/255))
                )
                
                Spacer()
                
                Image("limao novo")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(1.5, contentMode: .fit)
                    .animation(.easeIn(duration: 0.4))
                    .scaleEffect(setZoom(mag: self.mag))
                    .animation(nil)
                    .gesture(
                        MagnificationGesture()
                            .updating($mag, body: {(value,state, _) in
                                if(!locked){
                                    state = value
                                }
                                
                            })
                            .onEnded({value in
                                if(!locked){
                                    self.limaoScale = setZoom(mag: value)
                                }
                                if(self.limaoScale>1.65 && self.limaoScale < 1.75){
                                    locked = true
                                }
                            })
                        
                    )
                    
                    .background(
                        Image("limao setas")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(1.2, contentMode: .fit)
                            .scaleEffect(CGSize(width: 1.8, height: 1.8))
                            .opacity(0.2)
                        
                        
                    )
                
                Spacer()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)

    }
    
    func setZoom(mag: CGFloat) -> CGFloat{
        return max(min(self.limaoScale*mag, self.limaoMaxScale), self.limaoMinScale)
    }
    
}

struct Onboarding5_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding5()
    }
}
