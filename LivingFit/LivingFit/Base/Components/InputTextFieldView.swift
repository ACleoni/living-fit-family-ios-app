//
//  InputTextFieldView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI

struct InputTextFieldView: View {
    @Binding var text: String;
    let placeholder: String;
    let keyboardType: UIKeyboardType;
    let sfSymbol: String?
    
    private let textFiledLeading: CGFloat = 30
    
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(LFTextFieldStyle())
            .font(.custom("Poppins-Regular", size: 16))
            .keyboardType(.emailAddress)
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextFieldView(text: .constant(""), placeholder: "Email" , keyboardType: .emailAddress, sfSymbol: "envelope")
            .preview(with: "Input Text Field")
    }
}
