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
                        .font(.custom("Abstract Groovy", size: 85))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color( red: 1, green: 0.95, blue: 0.8))
                        .offset(x: 30, y: 60)
                    
                    
                    
                    Spacer()
                }
                
                Spacer()
                
                ZStack{
                    Image(imagemFruta)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(1.7, contentMode: .fit)
                        .offset(x: 0, y: -110)
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
                    
                    NavigationLink(
                        destination: getDestination(),
                        label: {
                            ZStack{
                                HStack {
                                    Spacer()
                                    Image(imagemBotao)
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(4, contentMode: .fit)
                                    Spacer()
                                    
                                }
                                
                                Text("Continuar")
                                    .font(.custom("Abstract Groovy", size: 25))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color( red: 1, green: 0.95, blue: 0.8))
                            }
                            .padding(.top, 200)
                            
                            
                        })
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    
                }
                
                Spacer()
                
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
        }else{
            return AnyView(telaDeInicio())
        }
    }
}

struct NivelConcluidoView_Previews: PreviewProvider {
    static var previews: some View {
        NivelConcluidoView(nivel: "0", color: Color(red: 0.78, green: 0.9, blue: 0.3), imagemFruta: "limao", imagemBotao: "botaoVerde")
            .previewDevice("iPod touch (7th generation)")
    }
}
