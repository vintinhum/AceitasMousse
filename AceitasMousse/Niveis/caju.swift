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
    let timer2 = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let timer3 = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @State public var currentDate2: CGFloat = 0
    @State public var currentDate3: Double = 0



    
    @State var offsetCaju: CGFloat = 0
    @State var completed: Bool = false
    @State var nextView: Bool = false
    @State var cajuTopOpacity: Double = 1
    @State var cajuImage: String = "cajuCorpo"
    @State var cajuScale: CGFloat = 1.0
    
    @State var wrongAttempt: Bool = false
    

    
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
                    // moveCaju()
                }
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            
            
            VStack{
                Spacer()
                
                Image("cajuTopo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.15)
                    .offset(x: offsetCaju, y: 0)
                    .animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: true))
                    .opacity(cajuTopOpacity)
             
                    .onReceive(timer2) { input in
                        
                        if currentDate2 == 2 {
                            currentDate2 = 0
                        }
                        else {
                            currentDate2 += 1
                        }
                        
                        
                        moveCaju()
                    }
                    .onReceive(timer3) { input in
                        print(currentDate3)
                        
                        if(Int(currentDate3)==2){
                            currentDate3 = 0
                        }else{
                            currentDate3+=0.1
                        }
                    }
                
                
                
                HStack{
                    Spacer()
                    Image(cajuImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.25)
                        .scaleEffect(cajuScale)
                        .offset(x: wrongAttempt ? -10 : 0)
                        .animation(Animation.default.repeatCount(5).speed(7))
                    
                    
                    
                    
                    Spacer()
                    
                }
                
                Spacer()
                
            }
            
            
            
        }
        .onTapGesture {
            
            if(completed){
                self.nextView = true
            }else{
                if((currentDate3 <= 0.1) ||
                    (currentDate3<=1.2 && currentDate3 >= 0.8 ) ||
                    (currentDate3<=2 && currentDate3 >= 1.8)){
                    
                    self.completed = true
                    cajuTopOpacity = 0
                    cajuImage = "cajuTodo"
                    cajuScale = 1.6
                    
                }else{
                    self.wrongAttempt.toggle()
                    complexSuccess()
                }
            }
            
        }
        
        .fullScreenCover(isPresented: $nextView, content: {
            NivelConcluidoView(nivel: "4", color: Color(red: 0.97, green: 0.77, blue: 0.28), imagemFruta: "cajuUnico", imagemBotao: "botaoLaranja")
        })
        
    }
    
    func moveCaju(){
        
        if(!completed){
            
            if self.currentDate2 == 0 {
                offsetCaju = UIScreen.main.bounds.width/2
            }else if(self.currentDate2 == 1) {
                offsetCaju = 0
            }else{
                offsetCaju = -(UIScreen.main.bounds.width/2 + UIScreen.main.bounds.width * 0.1)

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
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
}

struct caju_Previews: PreviewProvider {
    static var previews: some View {
        caju()
            .previewDevice("iPhone 8")
            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
        
    }
}
