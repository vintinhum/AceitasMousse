//
//  NivelConcluidoView.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 03/03/21.
//

import SwiftUI

struct NivelConcluidoView: View {
    var nivel: String
    var color: Color
    var imagemFruta: String
    var imagemBotao: String
    
    var body: some View {
        VStack{
            HStack{
                Text(nivel)
                
                Spacer()
            }
            
            Spacer()
            
            ZStack{
                Image(imagemFruta)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: 0, y: -100)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    
                Image("retanguloBege")
                    .resizable()
                    .frame(width: 370, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                    
                Text("Parabéns! Você conseguiu!")
                
                Button(action: {print("Passando pra proxima fase")}){
                    ZStack{
                        Image(imagemBotao)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 320, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Continuar")
                    }
                   

                        
                }
                .padding(.top, 200)
            }
      
       
            Spacer()
        }
        .background(color)
        .ignoresSafeArea()
    }
}

struct NivelConcluidoView_Previews: PreviewProvider {
    static var previews: some View {
        NivelConcluidoView(nivel: "0", color: Color(red: 0.78, green: 0.9, blue: 0.3), imagemFruta: "limao", imagemBotao: "botaoVerde")
    }
}
