//
//  PreviewLayoutComponentModifier.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI

struct PreviewLayoutComponentModifier: ViewModifier {
    let displayName: String
    
    func body(content: Content) -> some View {
        content
            .previewLayout(.sizeThatFits)
            .previewDisplayName(displayName)
            .padding()
    }
}

extension View {
    func preview(with displayName: String) -> some View {
        self.modifier(PreviewLayoutComponentModifier(displayName: displayName))
    }
}
