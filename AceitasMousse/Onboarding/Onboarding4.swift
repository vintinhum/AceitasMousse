//
//  Onboarding4.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct Onboarding4: View {
    // @State var offsetMaracuja = CGSize(width: 100, height: -190)
    @State var positionMaracuja = CGPoint(x:  UIScreen.main.bounds.size.width/2 , y: UIScreen.main.bounds.size.height/2 - 200) 
    //@State var positionLocked = false
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
            VStack{
                HStack {
                    Spacer()
                    ZStack(){
                        Text("Elas podem ser arrastadas")
                            .font(.custom("Ygro Sans Beta Medium", size: 25))
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .foregroundColor(.black)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 50)
                        
                        
                        
                    }
                    
                    Spacer()
                    
                }
                .background(
                    Rectangle()
                        .foregroundColor(Color.init(red: 251/255, green: 176/255, blue: 64/255))
                )
                

                
                Image("maracuja")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(1.1, contentMode: .fit)
                    .position(x: positionMaracuja.x, y: positionMaracuja.y)
                    .scaleEffect(0.7)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.positionMaracuja = gesture.location
                                
                                
                            }
                            
                            .onEnded { _ in
                                
                                if (self.positionMaracuja.x <= 10 &&
                                        self.positionMaracuja.x >= -10 &&
                                        
                                        self.positionMaracuja.y <= 10 && self.positionMaracuja.y >= -10 ){
                                    print("locked")
                                }
                            }
                        
                    )
            
                
            }
        }
    }
}

struct Onboarding4_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding4()
    }
}
