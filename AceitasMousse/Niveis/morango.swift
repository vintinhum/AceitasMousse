//
//  morango.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 26/02/21.
//

import SwiftUI
import CoreHaptics

struct morango: View {
    @State private var engine: CHHapticEngine?
    @State private var scale: CGFloat = 1
    @State private var numberOfTouches: Int = 0
    @State var fruta: String = "morango"

    
    @State public var currentDate: CGFloat = 0
    @State public var bgColor = Color.init(.cyan)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var wrongAttempt: Bool = false
    @State var opacity: Double = 1
    @State var nivelConcluido: Bool = false
    @State var nextView: Bool = false
    
    
    
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
                .onTapGesture {
                    if (self.nivelConcluido) {
                        self.nextView = true
                    }
                    else {
                        print("tocou errado")
                        self.wrongAttempt.toggle()
                        complexSuccess()
                    }
                }
            
            Image("\(fruta)")
                .resizable()
                .frame(width:100, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(self.opacity)
                .offset(x: wrongAttempt ? -10 : 0)
                .animation(Animation.easeIn.repeatCount(5, autoreverses: true).speed(7))
                .animation(nil)
                .scaleEffect(scale)
                .animation(.default)
                .onTapGesture {
                    if self.fruta == "" {
                        self.nivelConcluido = true
                        print("passou de nivel")
                    }
                    if numberOfTouches <= 6 {
                        scale += scale * 0.55
                        numberOfTouches += 1
                        //                    botao = ""
                    }
                    else {
                        //fruta = ""
                        self.opacity = 0
                        self.nivelConcluido = true
                        //                    botao = "botao"
                    }
                    
                }
            
        }
        
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarTitle("")
        .fullScreenCover(isPresented: $nextView, content: {
            NivelConcluidoView(nivel: "1", color: Color(red: 0.9, green: 0.2, blue: 0.24), imagemFruta: "retanguloBegeMorango", imagemBotao: "botaoVermelho")
            
        })
        
    }
    
    func updateColor() {
        if self.currentDate == 0 {
            self.bgColor = Color.init(.cyan)
        }
        else {
            self.bgColor = Color.init(.yellow)
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

struct morango_Previews: PreviewProvider {
    static var previews: some View {
        morango()
            .previewDevice("iPhone 12 Pro")
        
        
    }
}
