//
//  AgeSelectionView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/11/23.
//

import SwiftUI

struct AgeSelectionView: View {
    @State private var draggingItem = 0.0
    @State private var snappedItem = 0.0

    func distance(_ item: Int) -> Double {
            return (draggingItem - Double(item)).remainder(dividingBy: Double(100))
    }
    
    func myXOffset(_ item: Int) -> Double {
            let angle = Double.pi * 2 / Double(100) * distance(item)
            return sin(angle) * 200
        }
    
    var body: some View {
        VStack {
            VStack {
                Text("What's your gender?")
                    .font(.custom("Poppins-Regular", size: 30))
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(0 ..< 100) { item in
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    
                            }
                            .frame(width: 74, height: 44)
                            .scaleEffect(1.0 - abs(distance(item)) * 0.2 )
                            .opacity(1.0 - abs(distance(item)) * 0.3 )
                            .offset(x: myXOffset(item), y: 0)
                            .zIndex(1.0 - abs(distance(item)) * 0.1)
                        }
                    }
                    .padding()
                }
                .gesture(
                            DragGesture()
                                .onChanged { value in
                                    draggingItem = snappedItem + value.translation.width / 100
                                }
                                .onEnded { value in
                                    withAnimation {
                                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                                        draggingItem = round(draggingItem).remainder(dividingBy: Double(100))
                                        snappedItem = draggingItem
                                    }
                                }
                        )
                Spacer()
            }
        }
        .padding()
        .navigationBarTitle("Step 2 of 5").font(.custom("Poppins-Medium", size: 15))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AgeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AgeSelectionView()
        }
    }
}
