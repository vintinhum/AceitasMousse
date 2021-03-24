//
//  NivelConcluidoView.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 03/03/21.
//

import SwiftUI
import StoreKit

struct NivelConcluidoView: View {
    var nivel: String
    var color: Color
    var imagemFruta: String
    var imagemBotao: String
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text(nivel)
                        .font(.custom("Abstract Groovy", size: 55))
                        .multilineTextAlignment(.center)
                        .foregroundColor(color)
                        .background(
                            Image("levelCircle")
                            
                            
                        )
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: menuDeFasesView(),
                        label: {
                            ZStack{
                                Image("homeCircle")
                                    .padding()
                                    
                                
                                Image(systemName: "house.fill")
                                    .foregroundColor(color)
                                    .scaleEffect(2)
                            }
                            
                            
                        })
                        .padding(.top, 20)
                        
                }
                
                Spacer()
                
                ZStack{
                    Image(imagemFruta)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(1.7, contentMode: .fit)
                        .offset(x: 0, y: -130)
                        .zIndex(1.0)
                    
                    Image("retanguloBege")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal,20)
                    
                    
                    Text("Parabéns! \n Você conseguiu!")
                        .font(.custom("Ygro Sans Beta Medium", size: 25))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .foregroundColor(Color( red: 0.35, green: 0.1, blue: 0.01))
                    //                        .padding(.horizontal, 50)
                    
                    
                    
                }
                
                Spacer()
                
                NavigationLink(
                    destination: getDestination(),
                    label: {
                        
                        
                        Text("Continuar")
                            .font(.custom("Abstract Groovy", size: 25))
                            .multilineTextAlignment(.center)
                            .foregroundColor(color)
                            .padding()
                            
                            .background(
                                Image("botaoBege")
                                
                            )
                        
                        
                        
                    })
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .padding(.bottom, 40)
                
                
            }
            .onAppear {
                if(nivel == "5"){
                    AppReviewRequest.requestReviewIfNeeded()
                    
                }
                
            }
            .background(color)
            .ignoresSafeArea()
            
            
        }
        
    }
    
    func getDestination() -> AnyView {
        if (nivel == "1"){
            return AnyView(limao())
        }else if(nivel == "2"){
            return AnyView(maracuja())
        }else if(nivel == "3"){
            return AnyView(caju())
        }else if(nivel == "4"){
            return AnyView(cereja())
        }else{
            return AnyView(menuDeFasesView())
        }
    }
}

struct NivelConcluidoView_Previews: PreviewProvider {
    static var previews: some View {
        NivelConcluidoView(nivel: "0", color: Color(red: 0.78, green: 0.9, blue: 0.3), imagemFruta: "limao", imagemBotao: "botaoVerde")
            .previewDevice("iPod touch (7th generation)")
    }
}
