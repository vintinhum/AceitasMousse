//
//  iconeDeFase.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 18/03/21.
//

import SwiftUI

struct iconeDeFase: View {
    var body: some View {
        
        ZStack {
            
            
            Image("morango menu")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 3)
                .padding(.horizontal, UIScreen.main.bounds.width / 4.5)
            
        }
        
    }
}

struct iconeDeFase_Previews: PreviewProvider {
    static var previews: some View {
        iconeDeFase()
    }
}
