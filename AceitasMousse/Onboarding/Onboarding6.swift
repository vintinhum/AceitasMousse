//
//  Onboarding6.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct Onboarding6: View {
    @State var nextView = false
    
    
    var body: some View {
            ZStack{
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
                VStack{
                    HStack {
                        Spacer()
                        
                        Text("As possibilidades são infinitas!")
                            .font(.custom("Ygro Sans Beta Medium", size: 25))
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 40)
                        
                        
                        
                        Spacer()
                        
                    }
                    .padding(.vertical, 10)
                    
                    .background(
                        Rectangle()
                            .foregroundColor(Color.init(red: 63/255, green: 116/255, blue: 204/255))
                    )
                    
                    Image("fruzzle pizza")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Você está pronto para o primeiro desafio?")
                        .font(.custom("Ygro Sans Beta Medium", size: 25))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(Color(red: 31/255, green: 31/255, blue: 31/255))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 50)
                    
                    
                    Button(action: {
                        nextView = true
                    }, label: {
                        ZStack{
                            
                            Image("botaoAzul")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.4)
                            
                            
                            Text("Simm")
                                .font(.custom("Abstract Groovy", size: 25))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color( red: 1, green: 0.95, blue: 0.8))
                        }
                        .padding()
                        .offset(y: -50)
                    })
                }
            }
            .onAppear{
                UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            }
        
            .fullScreenCover(isPresented: $nextView, content: {
                morango()
            })
            
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
}

struct Onboarding6_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding6()
            .previewDevice("iPhone 11")
    }
}
