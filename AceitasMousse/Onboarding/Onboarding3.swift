//
//  Onboarding3.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct Onboarding3: View {
    @State var morangoScale: Double = 0.5
    @State var textOpacity: Double = 1
    
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
            VStack{
                HStack {
                    Spacer()
                    
                    Text("Aqui você pode interagir com as frutas de maneiras  variadas")
                        .font(.custom("Ygro Sans Beta Medium", size: 25))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 30)

                    Spacer()
                    
                }
                .background(
                    Rectangle()
                        .foregroundColor(Color.init(red: 253/255, green: 99/255, blue: 38/255))
                )
                
                Image("morango")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(CGSize(width: morangoScale, height: morangoScale))
                    .animation(.easeIn(duration: 0.4))
                    .onTapGesture {
                        morangoScale = 0.7
                        textOpacity = 0
                    }
                    .background(
                        Image("morango")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(1, contentMode: .fit)
                            .scaleEffect(CGSize(width: 1.4, height: 1.4))
                            .opacity(0.2)
                        
                        
                    )
                
                
                Text("experimente tocar no morango")
                    .font(.custom("Ygro Sans Beta Medium", size: 20))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .foregroundColor(Color(red: 31/255, green: 31/255, blue: 31/255))
                    .opacity(textOpacity)
                    .offset(x: 0, y: -50)
                
                Spacer()
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)

        
    }
}

struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3()
            .previewDevice("iPhone SE (2nd generation)")
    }
}
