//
//  maracuja.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 26/02/21.
//

import SwiftUI

struct maracuja: View {
    
    @State public var currentDate = 0
    @State public var bgColor = Color.purple
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var wrongAttempt: Bool = false
    @State var zIndex =  0.0
    @State var offsetMaracuja: CGSize = .zero
    @State var offsetSementes: CGSize = .zero
    @State var imagemMaracuja = "maracujaSemSementes"
    @State var imagemSementes = "sementes"
    @State var nextView: Bool = false

    
    
    var body: some View {
        ZStack {Rectangle()
            .foregroundColor(bgColor)
            .edgesIgnoringSafeArea(.all)
            .onReceive(timer) { input in
                
                if currentDate == 1 {
                    currentDate = 0
                }
                else {
                    currentDate += 1
                }
                
                updateColor()
            }
            .animation(.linear(duration: 0.3))
            .onTapGesture {
                print("tocou errado")
                self.wrongAttempt.toggle()
                
            }
            
            Image(imagemMaracuja)
                .resizable()
                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: offsetMaracuja.width, y: offsetMaracuja.height)
                .zIndex(1)
                .gesture(
                    DragGesture()
                            .onChanged { gesture in
                                self.offsetMaracuja = gesture.translation
                            }

                            .onEnded { _ in
                                if abs(self.offsetMaracuja.width) > 100 {
                                    // remove the card
                                } else {
//                                    self.offsetMaracuja = .zero
                                }
                            }
                
                )
                .onTapGesture {
                    if(imagemMaracuja=="maracuja"){
                        //Nível finalizado
                        self.nextView.toggle()
                    }
                }
            
            Image(imagemSementes)
                .resizable()
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .zIndex(self.zIndex)
                .offset(x: offsetSementes.width, y: offsetSementes.height)
                .gesture(
                    DragGesture()
                            .onChanged { gesture in
                                self.offsetSementes = gesture.translation
                                self.zIndex = 2
                            }

                            .onEnded { _ in
                                if (
                                    Int(abs(self.offsetSementes.height - self.offsetMaracuja.height)) < 50 &&
                                        Int(abs(self.offsetSementes.width - self.offsetMaracuja.width)) < 20) {
                                        //If seeds overlap maracuja
                                    self.imagemSementes = ""
                                    self.imagemMaracuja = "maracuja"
                                        
                                } else {
//                                    self.offsetMaracuja = .zero
                                }
                            }
                )
                
               
                
        }
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $nextView, content: {
            NivelConcluidoView(nivel: "3", color: Color(red: 0.97, green: 0.77, blue: 0.28), imagemFruta: "maracuja", imagemBotao: "botaoLaranja")

        })
    }
    
    func updateColor() {
        if self.currentDate == 0 {
            self.bgColor = .pink
        }
        else {
            self.bgColor = .purple
        }
    }
}

struct maracuja_Previews: PreviewProvider {
    static var previews: some View {
        maracuja()
    }
}
