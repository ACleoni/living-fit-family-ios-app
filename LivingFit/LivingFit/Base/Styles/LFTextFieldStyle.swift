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
            .background(Color(hex: "F7F8F8"))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color(hex: "F7F8F8")))
            .disableAutocorrection(true)
            .focused($isFocused)
            .onTapGesture {
                isFocused = true;
            }
    }
}
