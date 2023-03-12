//
//  SplashView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/10/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            MainView()
        } else {
            VStack {
                VStack {
                    Image("Full Logo Alt")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                }.scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeInOut) {
                        self.isActive.toggle()
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
