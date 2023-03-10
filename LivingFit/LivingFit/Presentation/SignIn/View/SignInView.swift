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
            VStack {
                Image("Alternate Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                Text("Welcome Back!")
                    .font(.custom("Poppins-SemiBold", size: 30))
                Text("Please sign in to your account")
                    .font(.custom("Poppins-Regular", size: 15)).opacity(0.70)
                    .padding(.bottom)
            }
            
            VStack {
                TextFieldView(text: $email, placeholder: "Email Address", keyboardType: .emailAddress)
                
                HStack {
                    if !showPassword {
                        SecureTextFieldView(password: $password, placeholder: "Password", keyboardType: .default)
                    } else {
                        TextFieldView(text: $password, placeholder: "Password", keyboardType: .default)
                    }
                }.overlay(alignment: .trailing) {
                    Image(showPassword ? "show" : "hide")
                        .resizable()
                        .frame(width: 24, height: 26)
                        .opacity(0.60)
                        .padding(.trailing)
                        .onTapGesture {
                            showPassword.toggle()
                        }
                }
            }
            
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Forgot Password?")
                        .foregroundColor(.colorPrimary)
                })
            }
            
//            HStack {
                ButtonView(title: "Sign In") {
                    
                }
//            }
            
            HStack {
                HorizontalLineView()
                Text("or")
                HorizontalLineView()
            }
            VStack {
                LoginProviderView(provider: "apple")
                LoginProviderView(provider: "google")

            }
            Spacer()
        }.padding().ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
