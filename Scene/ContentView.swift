//
//  ContentView.swift
//  Scene
//
//  Created by PRO M1 2020 8/256 on 04/08/23.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        VStack {
           Home()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: -HOME VIEW
struct Home: View {
    @State var models = [
        Model(id: 1, name: "Toyota Supra", modelName: "Toyota_Supra.usdz", details: "The insane tunability and durability of its engine and components mean that the supra could easily become faster than American muscle cars (that in many cases had double the displacement) or could even beat much more expensive Italian exotics."),
        Model(id: 2, name: "Nissan Skyline GTR C110", modelName: "Nissan_Skyline_GT-R_C110_Kenmeri_73.usdz", details: "Under the hood, Nissan installed a masterpiece, inline-six engine. Its two-liter displacement provided 160 hp, and it was fed through three double-barrel horizontal carburetors. It was the exact solution adopted by some European racing cars from that era. A five-speed manual sent the power to the rear wheels."),
        Model(id: 3, name: "Land Rover Defender 90", modelName: "Land_Rover_Defender_90_Lowpoly.usdz", details: "The Defender is a series of rugged off-road vehicles produced by Land Rover, with the 90, 110, and 130 referring to the wheelbase length in inches. Defender 90 has a wheelbase of 93 inches; Defender 110 has 119 inches; and Defender 130 has 119 inches too, but is a full 13.4 inches longer in length than Defender 110.")
    ]
    
    @State var index = 0
    
    var body: some View {
        VStack {
            SceneView (scene: SCNScene (named: models[index].modelName), options:
            [.autoenablesDefaultLighting,.allowsCameraControl])
            .frame (width: UIScreen.main.bounds .width , height:
            UIScreen.main.bounds .height / 4)
            
            ZStack {
                
                HStack {
                    
                    Button(action: {
                        withAnimation {
                            if index > 0 {
                                index -= 1
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.left").font(.system(size: 35, weight: .bold))
                            .opacity(index == 0 ? 0.3 : 1)
                    })
                    .disabled(index == 0 ? true : false)

                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation {
                            if index < models.count {
                                index += 1
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.right").font(.system(size: 35, weight: .bold))
                            .opacity(index == models.count - 1 ? 0.3 : 1)
                    })
                    .disabled(index == models.count - 1 ? true : false)
                }
                
                Text(models[index].name).font(.system(size: 30, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical, 30)
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("About")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(models[index].details)
            })
            .padding(.horizontal)
            
            Spacer(minLength: 0)
        }
    }
}

// MARK: -DATA MODEL
struct Model: Identifiable {
    var id: Int
    var name: String
    var modelName: String
    var details: String
}
