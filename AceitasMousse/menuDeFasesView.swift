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
    @ObservedObject var manager: Manager = Manager()

    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 255/255, green: 243/255, blue: 206/255))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: UIScreen.main.bounds.width / 3.5) {
                    ForEach(0..<iconesDeFases.count) { i in
                        iconesDeFases[i]
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 3, alignment: .center)
                            
                            .onTapGesture {
                                manager.index = i
                                manager.nextView = true
                            }
                        
                    }
                    
                }
                .modifier(ScrollingHStackModifier(items: iconesDeFases.count, itemWidth: 250, itemSpacing: 80))
                
                
                Spacer()
                
                
                Button(action: {
                    getDestination()
                }, label: {
                    Image("botaoMenuDeFases")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                })
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $manager.nextView, content: {
            listaDeFases[manager.index]
        })
        
    }
    
    func getDestination() -> AnyView {
        if (manager.scrollPosition == 1){
            return AnyView(limao())
        }else if(manager.scrollPosition == 2){
            return AnyView(maracuja())
        }else{
            return AnyView(morango())
        }
    }

    
}

struct menuDeFasesView_Previews: PreviewProvider {
    static var previews: some View {
        menuDeFasesView()
    }
}

class Manager: ObservableObject {
    @Published var nextView: Bool = false
    @Published var index: Int = 0
    @Published var scrollPosition: Int = 0
}

