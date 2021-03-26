//
//  Onboarding1.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct Onboarding1: View {
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
            
            VStack {
                Text("Bem-vinde ao")
                    .font(.custom("Ygro Sans Beta Medium", size: 25))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .foregroundColor(.black)
                
                Image("FruzzleMelhor")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .padding(.horizontal, 40)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)

        .ignoresSafeArea()
        .background(Color( red: 255/255, green: 243/255, blue: 206/255))
        

    }
}

struct Onboarding1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1()
    }
}
