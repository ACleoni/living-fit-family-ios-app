//
//  SignInView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
            Text("Welcome Back!")
                .font(.custom("Poppins-SemiBold", size: 30))
            Text("Please sign in to your account")
                .font(.custom("Poppins-Regular", size: 15)).opacity(0.70)
                .padding(.bottom)
            TextFieldView(text: $email, placeholder: "Email Address", keyboardType: .emailAddress)
            
            HStack {
                if !showPassword {
                    SecureTextFieldView(password: $password, placeholder: "Password", keyboardType: .default)
                } else {
                    TextFieldView(text: $password, placeholder: "Password", keyboardType: .default)
                }
            }.overlay(alignment: .trailing) {
                Image(systemName: showPassword ? "eye.circle" : "eye.slash")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                    .onTapGesture {
                        showPassword.toggle()
                    }
            }
            
            ButtonView(title: "Sign In") {
                
            }
        }.padding().ignoresSafeArea(.keyboard)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
