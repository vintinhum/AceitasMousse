//
//  menuDeFasesView.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 17/03/21.
//

import SwiftUI

struct menuDeFasesView: View {
    
    
    var iconesDeFases: [String] = ["morango menu", "limao menu", "maracuja menu"]
    var listaDeFases: [AnyView] = [AnyView(morango()), AnyView(limao()), AnyView(maracuja())]
    
    var body: some View {
        
        
        
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 255/255, green: 243/255, blue: 206/255))
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    
                    ScrollView(.horizontal) {
                        HStack {
                            
                            NavigationLink(
                                destination: morango(),
                                label: {
                                    Image("morango menu")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 3)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 4.5)
                                        
                                        
                                })
                            
                            
                            NavigationLink(
                                destination: limao(),
                                label: {
                                    Image("limao menu")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 3)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 4.5)
                                })
                            
                            NavigationLink(
                                destination: maracuja(),
                                label: {
                                    Image("maracuja menu")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 3)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 4.5)
                                })
                            
                        }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2, alignment: .center)
                    
                    Button(action: {
                        print("iniciar fase")
                    }, label: {
                        Image("botaoMenuDeFases")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                    })
                    
                }
            }
            
            
        }
        
    }
    
}

struct menuDeFasesView_Previews: PreviewProvider {
    static var previews: some View {
        menuDeFasesView()
    }
}
