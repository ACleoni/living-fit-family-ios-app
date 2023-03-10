//
//  LFTextFieldStyle.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI

struct LFTextFieldStyle: TextFieldStyle {
    @FocusState private var isFocused: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(maxWidth: .infinity, minHeight: 56)
            .padding(.leading, 16)
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color(hex: "D8DADC")))
            .disableAutocorrection(true)
            .focused($isFocused)
            .onTapGesture {
                isFocused = true;
            }
    }
}
