//
//  LFPrimitiveButtonStyle.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI

struct LFPrimitiveButtonStyle: PrimitiveButtonStyle {
    
    func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        MyButton(configuration: configuration)
    }
    
    struct MyButton: View {
        @GestureState private var pressed = false
        
        let configuration: PrimitiveButtonStyle.Configuration
        let color: Color = .green
        
        @State private var didTriggered = false
        
        var body: some View {
            // you can set minimumDuration to Double.greatestFiniteMagnitude if you think that
            // user can hold button for such a long time
            let longPress = LongPressGesture(minimumDuration: 300, maximumDistance: 300.0)
                .updating($pressed) { value, state, _ in
                    state = value
                    self.configuration.trigger()
                }
            
            return configuration.label
                .opacity(pressed ? 0.8 : 1.0)
                .gesture(longPress)
        }
    }
}
