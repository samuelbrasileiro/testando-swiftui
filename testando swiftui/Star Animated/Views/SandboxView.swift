//
//  SandboxView.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 12/10/22.
//

import SwiftUI

struct SandboxView: View {
    @ObservedObject var viewModel: SandboxViewModel
    
    init(width: CGFloat,
         height: CGFloat) {
        viewModel = .init(sandboxWidth: width,
                          sandboxHeight: height)
    }
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(viewModel.stars) { star in
                    StarView(star: star)
                        .offset(x: star.x,
                                y: star.y)
                        .animation(.default,
                                   value: star.x)
                }
                
            }
            .frame(width: viewModel.sandboxWidth,
                   height: viewModel.sandboxHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red)
            )
            HStack {
                Button("Add Star") {
                    viewModel.addStar()
                    
                }
                .font(.bold(.system(.body))())
                .foregroundColor(.red)
                .padding()
                .background(.primary)
                .cornerRadius(10)
                
                Spacer()
                
                Button("Remove Oldest Star") {
                    viewModel.removeStar()
                    
                }
                .font(.bold(.system(.body))())
                .foregroundColor(.primary)
                .padding()
                .background(.red)
                .cornerRadius(10)
                .opacity(viewModel.stars.isEmpty ? 0 : 1)
            }
            .padding(.top)
            VStack(alignment: .leading) {
                Text("Velocity: \(Int(viewModel.velocity))")
                Slider(value: $viewModel.velocity,
                       in: CGFloat(0)...CGFloat(100))
                
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}


struct SandboxView_Previews: PreviewProvider {
    static var previews: some View {
        SandboxView(width: 400, height: 600)
    }
}
