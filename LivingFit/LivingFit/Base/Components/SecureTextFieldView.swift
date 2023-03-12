//
//  SecureTextFieldView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI

struct SecureTextFieldView: View {
    @Binding var password: String
    let placeholder: String
    let keyboardType: UIKeyboardType;
    
    
    var body: some View {
        SecureField(placeholder, text: $password)
            .textFieldStyle(LFTextFieldStyle())
            .font(.custom("Poppins-Regular", size: 16))
            .keyboardType(keyboardType)
    }
}

struct SecureTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextFieldView(password: .constant(""), placeholder: "Password", keyboardType: .default)
            .preview(with: "Secure Input Text Field")
    }
}
