//
//  LoginProviderView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/10/23.
//

import SwiftUI

struct LoginProviderView: View {
    var provider: String;
    var body: some View {
        NavigationLink(destination: EmptyView()) {
            HStack {
                Image(provider)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Sign in with \(provider.capitalized)")
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(.black)
            }.padding([.top, .bottom], 17)
                .background(Color.white)
                .padding([.leading, .trailing],45)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .overlay(RoundedRectangle(cornerRadius: 28)
                    .stroke(Color(red: 0.8470588235294118, green: 0.8549019607843137, blue: 0.8627450980392157), lineWidth: 1))
                
        }
    }
}

struct LoginProviderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginProviderView(provider: "apple")
            .preview(with: "Login Provider")
    }
}
