//
//  limao.swift
//  AceitasMousse
//
//  Created by Vítor Bárrios Luís de Albuquerque on 26/02/21.
//

import SwiftUI
import CoreHaptics

struct limao: View {
    @State private var engine: CHHapticEngine?
    @State var limaoScale: CGFloat = 20
    let limaoMaxScale: CGFloat = 20
    let limaoMinScale: CGFloat = 0.5
    @State var lastScaleValue: CGFloat = 1.0
    @GestureState var mag: CGFloat = 1.0
    @State public var currentDate = 0
    @State public var bgColor = Color.purple
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var wrongAttempt: Bool = false
    @State var nextView: Bool = false
    
    var body: some View {
    
        ZStack {
            Rectangle()
                .foregroundColor(bgColor)
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: prepareHaptics)
                .onReceive(timer) { input in
                    
                    if currentDate == 1 {
                        currentDate = 0
                    }
                    else {
                        currentDate += 1
                    }
                    
                    updateColor()
                }
                .animation(.linear(duration: 0.3))
                .onTapGesture {
                    print("tocou errado")
                    self.wrongAttempt.toggle()
                    complexSuccess()
                    
                }

            Image("limao")
                .resizable()
                .frame(width: 358, height: 358, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: wrongAttempt ? -10 : 0)
                .animation(Animation.default.repeatCount(5).speed(7))
                .scaleEffect(setZoom(mag: self.mag))
                .animation(nil)
                .gesture(
                    MagnificationGesture()
                            .updating($mag, body: {(value,state, _) in
                                    state = value
                            
                            })
                            .onEnded({value in
                                self.limaoScale = setZoom(mag: value)
                            })
                    
                )
                
                .onTapGesture {
                    if(limaoScale==limaoMinScale){
                       //Passar de nível;
                        self.nextView.toggle()
                    }
            }
                
        }
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $nextView, content: {
            NivelConcluidoView(nivel: "2", color: Color(red: 0.78, green: 0.9, blue: 0.3), imagemFruta: "limao", imagemBotao: "botaoVerde")

        })
        
    }
    
    func setZoom(mag: CGFloat) -> CGFloat{
        return max(min(self.limaoScale*mag, self.limaoMaxScale), self.limaoMinScale)
    }
    
    func updateColor() {
            if self.currentDate == 0 {
                self.bgColor = .red
            }
            else {
                self.bgColor = .orange
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

struct limao_Previews: PreviewProvider {
    static var previews: some View {
        limao()
            .previewDevice("iPhone 11")
    }
}
