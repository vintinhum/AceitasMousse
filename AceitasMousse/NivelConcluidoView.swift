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
                        .padding(.horizontal,20)
                    
                    
                    
                    Text("Parabéns! \n Você conseguiu!")
                        .font(.custom("Ygro Sans Beta Medium", size: UIScreen.main.bounds.height * 0.03))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .foregroundColor(Color( red: 0.35, green: 0.1, blue: 0.01))
                        .padding(.top, UIScreen.main.bounds.width * 0.15 )
                    
                    
                    //                        .padding(.horizontal, 50)
                    
                    
                    
                }
                
                Spacer()
                
                NavigationLink(
                    destination: getDestination(),
                    label: {
                        
                        
                        Text("Continuar")
                            .font(.custom("Abstract Groovy", size:  UIScreen.main.bounds.width * 0.05))
                            .multilineTextAlignment(.center)
                            .foregroundColor(color)
                            
                            .background(
                                Image("botaoBege")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                            )
                            .padding()
                            .padding(.bottom)
                        
                        
                        
                        
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
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        
        
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
        NivelConcluidoView(nivel: "0", color: Color(red: 0.78, green: 0.9, blue: 0.3), imagemFruta: "retanguloBegeLimao", imagemBotao: "botaoVerde")
            .previewDevice("iPhone 8")
    }
}
