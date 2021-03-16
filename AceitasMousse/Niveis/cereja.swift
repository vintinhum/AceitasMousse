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
                        Spacer()

                        Image("cherries")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/, contentMode: .fit)
                            .gesture(
                                DragGesture(coordinateSpace: .global)
                                        .onChanged { gesture in
                                            gesture.translation
                                        }

                                        .onEnded { value in
                                            if (
                                              value.location.x>=140 && value.location.x<=300 && value.location.y>=400 && value.location.y<=700) {
                                                    //If seeds overlap maracuja
                                                print("level over")
                                                    
                                            } else {
            //                                    self.offsetMaracuja = .zero
                                            }
                                        }
                            )
                        Spacer()

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
    }
}
