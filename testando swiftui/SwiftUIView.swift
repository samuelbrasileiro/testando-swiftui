//
//  SwiftUIView.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 12/10/22.
//

import SwiftUI

struct ScaleAnimation: View {
    @State var scale: CGFloat = 1
    var body: some View {
        Button(action: {
            withAnimation(.default.repeatCount(3)) {
                scale *= 2
            }
        }) {
            Text("Botão")
                .scaleEffect(scale)
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleAnimation()
    }
}

