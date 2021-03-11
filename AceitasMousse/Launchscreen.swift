//
//  Launchscreen.swift
//  AceitasMousse
//
//  Created by Ana Clara Lopes on 02/03/21.
//

import SwiftUI

var images: [UIImage]! =
    [UIImage(named: "Fruzzle")!, UIImage(named: "Fruzzle-1")!, UIImage(named: "Fruzzle-2")!, UIImage(named: "Fruzzle-3")!, UIImage(named: "Fruzzle-4")!, UIImage(named: "Fruzzle-5")!]

let animatedImage = UIImage.animatedImage(with: images, duration: 3)

struct launchScreen: View {
        
    var body: some View {
        
    
        ZStack {
            Color("corBG")
                .ignoresSafeArea()
            
            VStack() {
                
                fruzzleAnimation()
                    .padding(.horizontal, 100.0)
                    .aspectRatio(contentMode: .fit)
  
            } // VStack
            
        } // ZStack
        
    } // fecha View
}


struct fruzzleAnimation: UIViewRepresentable {
    
    func makeUIView(context: Self.Context) -> UIImageView {
        return UIImageView(image: animatedImage)
    }
    
    func updateUIView(_ uiView: UIImageView, context: UIViewRepresentableContext<fruzzleAnimation>) {
        
    }
}




struct launchscreen_Previews: PreviewProvider {
    static var previews: some View {
        launchScreen()
    }
}
