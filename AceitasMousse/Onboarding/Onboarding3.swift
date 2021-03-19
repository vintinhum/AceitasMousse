//
//  Onboarding3.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct Onboarding3: View {
    @State var morangoScale: Double = 0.6
    @State var textOpacity: Double = 1
    
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
            VStack{
                HStack {
                    Spacer()
                    ZStack(){
                        Text("Aqui você pode interagir com as frutas de maneiras  variadas")
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
                        .foregroundColor(Color.init(red: 253/255, green: 99/255, blue: 38/255))
                )
                
                Image("morango")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(1, contentMode: .fit)
                    .scaleEffect(CGSize(width: morangoScale, height: morangoScale))
                    .animation(.easeIn(duration: 0.4))
                    .onTapGesture {
                        morangoScale = 1.1
                        textOpacity = 0
                    }
                    .background(
                        Image("morango")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(1, contentMode: .fit)
                            .scaleEffect(CGSize(width: 1.8, height: 1.8))
                            .opacity(0.2)
                           
                    
                    )
                
                
                Text("experimente tocar no morango")
                    .font(.custom("Ygro Sans Beta Medium", size: 25))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .foregroundColor(Color(red: 31/255, green: 31/255, blue: 31/255))
                    .opacity(textOpacity)
                
                Spacer()
                    
            }
        }

    }
}

struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3()
    }
}
