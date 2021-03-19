//
//  Onboarding5.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct Onboarding5: View {
    @State var limaoScale: CGFloat = 1
    let limaoMaxScale: CGFloat = 20
    let limaoMinScale: CGFloat = 0.5
    @State var lastScaleValue: CGFloat = 1.0
    @GestureState var mag: CGFloat = 1.0
    
    var body: some View {
        
        ZStack{
        Rectangle()
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
        VStack{
            HStack {
                Spacer()
                ZStack(){
                    Text("e podem mudar de tamanho")
                        .font(.custom("Ygro Sans Beta Medium", size: 25))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .foregroundColor(.white)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 50)
                    
                    
                    
                }
                
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
                                    state = value
                            
                            })
                            .onEnded({value in
                                self.limaoScale = setZoom(mag: value)
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
