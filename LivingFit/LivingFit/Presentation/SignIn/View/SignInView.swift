//
//  SignInView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI

extension View {
    
}


struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.left") 
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundColor(.black)
        }
    }
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome Back").font(.custom("Poppins-SemiBold", size: 30))
                Text("Please sign in to your acccount").font(.custom("Poppins-Regular", size: 15)).opacity(0.70)
            }.padding(.bottom)
            
            VStack {
                HStack {
                    TextFieldView(text: $email, placeholder: "Email Address", keyboardType: .emailAddress)
                }
                
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
            }.padding(.top)
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Forgot Password?")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color(hex: "363636"))
                        .underline()
                        .opacity(0.70)
                })
            }.padding(.bottom)
            
            HStack {
                ButtonView(title: "Sign In") {
                    
                }
            }.padding(.top)
            
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
        }
        .padding()
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInView()
        }
    }
}
