//
//  Onboarding2.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct Onboarding2: View {
    @State var opacityLimao: Double = 0
    @State var opacityMaracuja: Double = 0
    @State var opacityMorango: Double = 0
    
    @State var scaleLimao: Double = 0
    @State var scaleMaracuja: Double = 0
    @State var scaleMorango: Double = 0
    
    @State public var currentDate: CGFloat = 0
    let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()


    
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
            
            VStack{
                ZStack{
                    Text("No nosso pomar tem tudo que é fruta")
                        .font(.custom("Ygro Sans Beta Medium", size: 25))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .foregroundColor(.white)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 50)
                        .background(
                            Rectangle()
                                .foregroundColor(Color.init(red: 100/255, green: 142/255, blue: 79/255))
                        
                        )
                }
                
                
                HStack {
                    Spacer()
                    Image("limao novo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(1.3, contentMode: .fit)
                        .opacity(opacityLimao)
                        .scaleEffect(CGSize(width: scaleLimao, height: scaleLimao))
                    
                        .animation(.easeIn(duration: 1.5))
                        .onAppear{
                            opacityLimao = 1
                            scaleLimao = 1
                        }

                    
                    Image("planta1")
                        .resizable()
                        .scaledToFit()


                }
                
                HStack {
                    Image("planta2")
                        .resizable()
                        .scaledToFit()
                    
                    Image("maracuja")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(1.1, contentMode: .fit)
                        .offset(x: -20)
                        .opacity(opacityMaracuja)
                        .scaleEffect(CGSize(width: scaleMaracuja, height: scaleMaracuja))
                        .animation(.easeIn(duration: 1.5))

                        .onReceive(timer) { input in
                            
                            currentDate += 1
                            
                            if(currentDate==1){
                                changeMaracujaOpacity()
                            }
                            
                            if(currentDate==2){
                                changeMorangoOpacity()
                            }
                        }



                    
                    Image("morango")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(0.8, contentMode: .fit)
                        .offset(x: 10, y: -65)
                        .opacity(opacityMorango)
                        .scaleEffect(CGSize(width: scaleMorango, height: scaleMorango))
                        .animation(.easeIn(duration: 1.5))



                    
                    Spacer()
                }
                
                Spacer()
            }
        }


    }
    
    func changeMaracujaOpacity(){
        opacityMaracuja = 1
        scaleMaracuja = 1
    }
    
    func changeMorangoOpacity(){
        opacityMorango = 1
        scaleMorango = 1

    }
}

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2()
    }
}
