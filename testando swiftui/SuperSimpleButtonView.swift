//
//  SuperSimpleButtonView.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 11/10/22.
//

import SwiftUI

struct SuperSimpleButtonView: View {
    @State private var isStarVisible = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.fill")
                .opacity(isStarVisible ? 1 : 0)
            Button(action: {
                isStarVisible.toggle()
            }) {
                VStack {
                    Text("Botão")
                    Image(systemName: "star.fill")
                }
                .padding()
                .background(Color.orange)
            }
        }
    }
}

struct SuperSimpleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SuperSimpleButtonView()
    }
}

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
