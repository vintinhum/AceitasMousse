//
//  caju.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 16/03/21.
//

import SwiftUI
import CoreHaptics


struct caju: View {
    @State private var engine: CHHapticEngine?

    @State public var currentDate: CGFloat = 0
    @State public var bgColor = Color.init(.yellow)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .foregroundColor(bgColor)
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: prepareHaptics)
                .onReceive(timer) { input in
                    
                    if currentDate == 2 {
                        currentDate = 0
                    }
                    else {
                        currentDate += 1
                    }
                    
                    updateColor()
                }
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            
            
            VStack{
                Spacer()
                Image("cajuTop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.15)
                
                HStack{
                    Spacer()
                    Image("cajuBottom")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.25)


                    
                    Spacer()

                }
                
                Spacer()
                
            }
           


        }

    }
    
    func updateColor() {
        if self.currentDate == 0 {
            self.bgColor = Color.init(.yellow)
        }
        else {
            self.bgColor = Color.init(.blue)
        }
        
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
}

struct caju_Previews: PreviewProvider {
    static var previews: some View {
        caju()
            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
            .previewDevice("iPad Pro (12.9-inch) (4th generation)")

    }
}
