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
                    .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
                
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
                        destination: getDestination(),
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
    
    func getDestination() -> AnyView {
//        print(UserDefaults.standard.bool(forKey: "didLaunchBefore"))
//        if (UserDefaults.standard.bool(forKey: "didLaunchBefore")) {
//            return AnyView(menuDeFasesView())
//        } else {
            return AnyView(OnboardingTab())
//        }
    }
}

struct telaDeInicio_Previews: PreviewProvider {
    static var previews: some View {
        telaDeInicio()
            .previewDevice("iPhone 12 Pro Max")
    }
}
 
