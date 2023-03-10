//
//  InputTextFieldView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String;
    let placeholder: String;
    let keyboardType: UIKeyboardType;
        
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(LFTextFieldStyle())
            .font(.custom("Poppins-Regular", size: 16))
            .keyboardType(keyboardType)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""), placeholder: "Email" , keyboardType: .emailAddress)
            .preview(with: "Input Text Field")
    }
}
