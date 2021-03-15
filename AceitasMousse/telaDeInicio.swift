//
//  telaDeInicio.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 03/03/21.
//

import SwiftUI

struct telaDeInicio: View {
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            
            ZStack{
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.init(red: 255/255, green: 243/255, blue: 206/255))
                
                VStack{
                    HStack {
                        Image("maracuja inicial")
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()

                        Image("limao novo inicial 2")
                            .resizable()
                            .scaledToFit()

                    }
                    
                    
                    NavigationLink(
                        destination: morango(),
                        label: {
                            Image("jogar")
                                .resizable()
                                .frame(width: 172, height: 37, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    

                    
                    HStack {

                        Image("melancia inicial 2")
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()

                        

                    }
                    
                    HStack{

                        Spacer()

                        Image("goiaba inicial")
                            .resizable()
                            .scaledToFit()
                        
                        
                    }
                    
                    
                   
                    
                    
                }
                .ignoresSafeArea()
                
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct telaDeInicio_Previews: PreviewProvider {
    static var previews: some View {
        telaDeInicio()
            .previewDevice("iPhone 12 Pro Max")
    }
}
