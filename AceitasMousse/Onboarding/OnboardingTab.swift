//
//  OnboardingTab.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 18/03/21.
//

import SwiftUI

struct OnboardingTab: View {
    
    init(){
       
    }
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
            
            TabView{
                Onboarding1()
                Onboarding2()
                Onboarding3()
                Onboarding4()
                Onboarding5()
                Onboarding6()
                    
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(Color(red: 249/255, green: 237/255, blue: 221/255))
            .foregroundColor(Color.init(red: 249/255, green: 237/255, blue: 221/255))
        }

        
        

    }

}

struct OnboardingTab_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTab()
            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
    }
}
