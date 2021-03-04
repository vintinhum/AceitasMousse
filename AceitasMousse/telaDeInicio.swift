//
//  telaDeInicio.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 03/03/21.
//

import SwiftUI

struct telaDeInicio: View {
    var body: some View {
        NavigationView {
            
            ZStack{
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.init(red: 245/255, green: 25/255, blue: 64/255))
                
                HStack {
                    Image("maracuja inicial")
                        .resizable()
                        .frame(width: 204, height: 218, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .position(x: 100, y: 61)
                    Image("limao inicial")
                        .resizable()
                        .frame(width: 280, height: 508, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .position(x: 65, y: 200)
                }
                
                HStack {
                    Image("melancia")
                        .resizable()
                        .frame(width: 419, height: 425, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .position(x: -10, y: 700)
                        .padding(.trailing)
                    Image("goiaba inicial")
                        .resizable()
                        .frame(width: 131, height: 262, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .position(x: 140, y: 600)
                        .padding()
                    
                }
                
                    NavigationLink(
                        destination: morango(),
                        label: {
                            Image("play button")
                                .resizable()
                                .frame(width: 172, height: 37, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                
                
                    
            }
        }
    }
}

struct telaDeInicio_Previews: PreviewProvider {
    static var previews: some View {
        telaDeInicio()
    }
}
