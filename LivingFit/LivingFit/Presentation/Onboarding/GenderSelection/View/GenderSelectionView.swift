//
//  GenderSelectionView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/11/23.
//

import SwiftUI

enum Gender {
    case male
    case female
    
    var data: (id: String, name: String) {
        switch self {
        case .male:
            return ("0", "male")
        case .female:
            return ("1", "female")
        }
    }
}

struct GenderSelectionView: View {
    @State var selectedId: String = ""
    let male = Gender.male.data
    let female = Gender.female.data
    
    func handleRadioButtonSelected(id: String) -> Void {
        DispatchQueue.main.async { self.selectedId = id }
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("What's your gender?")
                    .font(.custom("Poppins-SemiBold", size: 30))
            }.padding()
            ZStack {
                Rectangle().fill(.white)
                VStack {
                    RadioButtonView(id: male.id,
                                    label: male.name , symbol: male.name,
                                    isSelected: selectedId == male.id ? true : false,
                                    callback: handleRadioButtonSelected)
                    .padding(.bottom)
                    
                    RadioButtonView(id: female.id,
                                    label: female.name,
                                    symbol: female.name,
                                    isSelected: selectedId == female.id ? true : false,
                                    callback: handleRadioButtonSelected)
                    .padding(.top)
                }
            }
            NavigationLink(destination: HeightSelectionView()) {
                ButtonView(title: "Continue") {
                    
                }
            }
        }
        .padding()
        .navigationBarTitle("Step 1 of 5").font(.custom("Poppins-Medium", size: 15))
        .navigationBarTitleDisplayMode(.inline)
    
        
    }
}

struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GenderSelectionView()
        }
    }
}
