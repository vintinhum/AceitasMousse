//
//  limao.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 26/02/21.
//

import SwiftUI

struct limao: View {
    var body: some View {
        Image("limao")
            .resizable()
            .frame(width: 358, height: 358, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct limao_Previews: PreviewProvider {
    static var previews: some View {
        limao()
    }
}
