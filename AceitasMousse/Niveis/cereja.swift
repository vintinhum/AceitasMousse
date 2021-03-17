//
//  cereja.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 16/03/21.
//

import SwiftUI
import CoreHaptics


struct cereja: View {
    @State private var engine: CHHapticEngine?

    @State public var bgColor = Color.init(.purple)

    @State public var currentDate: CGFloat = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var spacerSize: CGSize = CGSize(width: 0, height: 1000)
    
    @State var offsetCereja: CGPoint = .zero
    
    @State private var fingerLocation: CGPoint?
    
    var cherrieDrag: some Gesture {
            DragGesture()
                .onChanged { gesture in
                    offsetCereja = gesture.location
                }

                .onEnded { value in
                     print(value.location.y)
                    if (offsetCereja.y <= -1000 && offsetCereja.y >= -1200 &&
                            offsetCereja.x <= 10 && offsetCereja.x >= -10) {
                        print("level over")
                            
                    } else {
//                                    self.offsetMaracuja = .zero
                    }
                }
    }
    
    var fingerDrag: some Gesture { // 2
            DragGesture()
                .onChanged { value in
                    self.fingerLocation = value.location
                }
                .onEnded { value in
                    self.fingerLocation = nil
                }
        }
        
    
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
            
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    Spacer(minLength: 300)
                    
                    HStack{
                        Spacer()
                        Image("muffin")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    
                      
        
                    Spacer(minLength: spacerSize.height)
                        
                    
                    HStack{
                        Spacer(minLength: UIScreen.main.bounds.size.width/2 )

                        Image("cherries")
                            .resizable()
                            .scaledToFit()
                            .position(x: offsetCereja.x, y: offsetCereja.y)
                            .aspectRatio(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/, contentMode: .fit)
                            .gesture(
                                cherrieDrag.simultaneously(with: fingerDrag) // 4

                            )

                    }
                    
                }
                .ignoresSafeArea()
            }
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
    
    func updateColor() {
        if self.currentDate == 0 {
            self.bgColor = Color.init(.red)
        }
        else {
            self.bgColor = Color.init(.purple)
        }
        
    }
}

struct cereja_Previews: PreviewProvider {
    static var previews: some View {
        cereja()
            .previewDevice("iPad (8th generation)")
    }
}
