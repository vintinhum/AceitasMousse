//
//  maracuja.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 26/02/21.
//

import SwiftUI

struct maracuja: View {
    var body: some View {
        Image("maracuja")
            .resizable()
            .frame(width: 486, height: 503, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct maracuja_Previews: PreviewProvider {
    static var previews: some View {
        maracuja()
    }
}
