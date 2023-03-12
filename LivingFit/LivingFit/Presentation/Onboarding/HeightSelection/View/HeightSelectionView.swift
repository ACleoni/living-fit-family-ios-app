//
//  HeightSelectionView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/12/23.
//

import SwiftUI
import AudioToolbox

struct HeightSelectionView: View {
    @State var offset: CGFloat = 0
    var pickerCount = 50
    
    func calculateWeight() -> String {
        let startWeight = 50
        let progress = offset / 10
        return "\(startWeight + (Int(progress)))"
    }
    
    var body: some View {
        VStack {
            Text("What's your current weight?")
                .font(.custom("Poppins-SemiBold", size: 30))
                .padding([.top, .leading])
                .multilineTextAlignment(.center)
            ZStack {
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 28)
                            .fill(.white)
                            .frame(width: 130, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .stroke(Color(hex: "55C856")))
                        Text("kg").padding(.leading, 65)
                        
                    }
                }.overlay(alignment: .leading) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Color(hex: "55C856"))
                            .frame(width: 65, height: 35)
                            .padding(.leading, 2)
                        Text("lbs")
                            .foregroundColor(.white)
                    }
                }
            }
              
            HStack(alignment: .lastTextBaseline) {
                Text("\(calculateWeight())").font(.custom("Poppins-SemiBold", size: 64))
                Text("lbs").font(.custom("Poppins-Medium", size: 16))
            }.padding(.top)
        
            CustomSlider(offset: $offset, pickerCount: pickerCount) {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(alignment: .lastTextBaseline, spacing: 0) {
                        ForEach(1...pickerCount - 5, id: \.self) { index in
                            VStack {
                                Rectangle()
                                    .fill(Color(hex: "B9B9B9"))
                                    .frame(width: 1, height: 40)
                                    .overlay(
                                        Text("\(40 + (index * 10))")
                                    )
                            }.frame(width: 10)
                            
                            ForEach(1...9, id: \.self) {subIndex in
                                Rectangle().fill(Color(hex: "D8DADC"))
                                    .frame(width: 1, height: 25)
                                    .frame(width: 10)
                            }
                            
                        }
                        Rectangle()
                            .fill(Color(hex: "B9B9B9"))
                            .frame(width: 1, height: 40)
                            .frame(width: 10)
                    }
                    // Move first tick to center
                    .offset(x: (getRect().width - 42) / 2)
                    .padding(.trailing, getRect().width - 30)
                })
                .frame(height: 50)
                .padding()
            }.padding(.top)
            .overlay(
               Rectangle()
                .fill(Color(hex: "55C856"))
                .frame(width: 2, height: 80)
                .offset(x: 0.2, y: -158)
            )
            NavigationLink(destination: EmptyView()) {
                ButtonView(title: "Continue") {
                    
                }
            }.padding()
        }
        .navigationBarTitle("Step 1 of 5").font(.custom("Poppins-Medium", size: 15))
        .navigationBarTitleDisplayMode(.inline)
    }
}

func getRect() -> CGRect {
    return UIScreen.main.bounds
}

struct HeightSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HeightSelectionView()
        }
    }
}

struct CustomSlider<Content: View> : UIViewRepresentable {
    var content: Content
    //binding offset for kg calculations
    @Binding var offset: CGFloat
    var pickerCount: Int
    
    init(offset: Binding<CGFloat>, pickerCount: Int, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self._offset = offset
        self.pickerCount = pickerCount
    }
    
    func makeCoordinator() -> Coordinator {
        return CustomSlider.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> some UIScrollView {
        let scrollView = UIScrollView()
        let swiftUIView = UIHostingController(rootView: content).view!
        // 50 * 9 = 450 + 50 = 500
        let width = CGFloat((pickerCount * 5) * 20) + (getRect().width - 500)
        
        swiftUIView.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
                scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: CustomSlider
        
        init(parent: CustomSlider) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            let value = (offset / 10).rounded(.toNearestOrAwayFromZero)
            scrollView.setContentOffset(CGPoint(x: value * 10, y: 0), animated: false)
            
//            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
//            AudioServicesPlayAlertSound(1157)
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if !decelerate {
                let offset = scrollView.contentOffset.x
                let value = (offset / 10).rounded(.toNearestOrAwayFromZero)
                scrollView.setContentOffset(CGPoint(x: value * 10, y: 0), animated: true)
                
//                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
//                AudioServicesPlayAlertSound(1157)
            }
        }
    }
}
