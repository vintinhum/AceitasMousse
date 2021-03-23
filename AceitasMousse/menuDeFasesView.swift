//
//  menuDeFasesView.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 17/03/21.
//

import SwiftUI

struct menuDeFasesView: View {
    
    
    var iconesDeFases: [Image] = [.init("morango menu"), .init("limao menu"), .init("maracuja menu")]
    var listaDeFases: [AnyView] = [AnyView(morango()), AnyView(limao()), AnyView(maracuja())]
    @State var nextView: Bool = false
    @State var index: Int = 0
    @State var chosenView: AnyView?
    
    var body: some View {
        
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 255/255, green: 243/255, blue: 206/255))
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Spacer()
                    HStack(alignment: .center, spacing: UIScreen.main.bounds.width / 3.5) {
                            ForEach(0..<iconesDeFases.count) { i in
                                        iconesDeFases[i]
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 3, alignment: .center)
                                            .onTapGesture {
                                                index = i
                                                print(index)
                                                chosenView = listaDeFases[index]
                                                nextView = true
                                                
                                            }
                            }
                        }
                        .modifier(ScrollingHStackModifier(items: iconesDeFases.count, itemWidth: 250, itemSpacing: 80))
                    
                    Spacer()
                        
                    
                    Button(action: {
                        print("iniciar fase")
                    }, label: {
                        Image("botaoMenuDeFases")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                    })
                    Spacer()
                }
            }
            .fullScreenCover(isPresented: $nextView, content: {
                chosenView
                })
            
        }
}

struct menuDeFasesView_Previews: PreviewProvider {
    static var previews: some View {
        menuDeFasesView()
    }
}
