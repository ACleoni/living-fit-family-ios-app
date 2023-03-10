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
                .stroke(Color(red: 0.8470588235294118, green: 0.8549019607843137, blue: 0.8627450980392157)))
            .disableAutocorrection(true)
            .focused($isFocused)
            .onTapGesture {
                isFocused = true;
            }
    }
}
