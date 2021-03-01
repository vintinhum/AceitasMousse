//
//  morango.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 26/02/21.
//

import SwiftUI

struct morango: View {
    var body: some View {
        Image("morango")
            .resizable()
            .frame(width: 297, height: 475, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct morango_Previews: PreviewProvider {
    static var previews: some View {
        morango()
    }
}
