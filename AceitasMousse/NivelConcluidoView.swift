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
                        .font(.custom("Abstract Groovy", size: UIScreen.main.bounds.height * 0.07))
                        .multilineTextAlignment(.center)
                        .foregroundColor(color)
                        .background(
                            Image("levelCircle")
                                .scaleEffect(UIScreen.main.bounds.height*0.002)
                            
                            
                        )
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: menuDeFasesView(),
                        label: {
                            ZStack{
                                Image("homeCircle")
                                    .padding()
                                    .scaledToFit()
                                    .scaleEffect(UIScreen.main.bounds.height*0.001)
                                                

                                
                                
                                
                                Image(systemName: "house.fill")
                                    .foregroundColor(color)
                                    .scaleEffect(UIScreen.main.bounds.height*0.002)
                                    .scaledToFit()
                                    
                            }
                            
                            
                        })
                        .padding(.top, UIScreen.main.bounds.height*0.02)
                        .padding(.trailing, UIScreen.main.bounds.width/500)
                     
                    
                }
                
                Spacer()
                
                ZStack{
                    
                    Image(imagemFruta)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal,20)
                    
                    
                    
                    Text("Parabéns! \n Você conseguiu!")
                        .font(.custom("Ygro Sans Beta Medium", size: UIScreen.main.bounds.width * 0.05))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .foregroundColor(Color( red: 0.35, green: 0.1, blue: 0.01))
                        .fixedSize()
                        .padding(.top, UIScreen.main.bounds.width * 0.18 )
            
                    
                    
                    //                        .padding(.horizontal, 50)
                    
                    
                    
                }
                
                Spacer()
                
                NavigationLink(
                    destination: getDestination(),
                    label: {
                        
                        
                        Text("Continuar")
                            .font(.custom("Abstract Groovy", size:  UIScreen.main.bounds.width * 0.06))
                            .multilineTextAlignment(.center)
                            .foregroundColor(color)
                            
                            .background(
                                Image("botaoBege")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width/1.7, height: UIScreen.main.bounds.height/8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                            )
                            .padding()
                            .padding(.bottom, 40)
                        
                        
                        
                        
                    })
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .padding(.bottom, UIScreen.main.bounds.height/300)
                
                
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
            .previewDevice("iPad Air (4th generation)")
    }
}
