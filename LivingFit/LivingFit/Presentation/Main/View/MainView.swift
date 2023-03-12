//
//  MainView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/10/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Load the resource -> h
        let fileUrl = Bundle.main.url(forResource: "onboarding", withExtension: "mov")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player;
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        // Create a new player looper with the queue player and template items
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        // Start the movie
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct MainView: View {
    var body: some View {
        NavigationView {
            GeometryReader{ geo in
                ZStack {
                    PlayerView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .overlay(Color.black.opacity(0.2))
                        .edgesIgnoringSafeArea(.all)
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.0), .black.opacity(1.0)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: geo.size.width, height: geo.size.height)
                    
                    Image("Full Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .padding(.zero)
                    
                    
                    VStack {
                        Spacer()
                        Text("Atlanta’s #1 In Person Training Available Worldwide")
                            .font(.custom("Poppins-Bold", size: 24))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        
                        
                        NavigationLink(destination: GenderSelectionView()) {
                            ButtonView(title: "Get Started") {
                                
                            }
                        }
                        
                        .padding(.bottom)
                        NavigationLink(destination: SignInView()) {
                            HStack {
                                Text("Sign In")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .foregroundColor(.white)
                                Image(systemName: "chevron.forward")
                                    .font(.custom("Poppins-Regular", size: 12))
                                    .foregroundColor(.white)
                                    .aspectRatio(.infinity, contentMode: .fill)
                                    .animation(.easeInOut, value: 10)
                            }
                        }.padding(.bottom)
                    }
                }
            }.background(.black)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
