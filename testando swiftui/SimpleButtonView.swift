//
//  SimpleButtonView.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 11/10/22.
//

import SwiftUI

class StarItem: ObservableObject {
    @Published var isStarVisible: Bool
    
    init() {
        isStarVisible = false
    }
}

struct SimpleButtonView: View {
    @ObservedObject var item = StarItem()
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.fill")
                .opacity(item.isStarVisible ? 1 : 0)
            Button("Toque aqui para aparecer a estrela") {
                item.isStarVisible.toggle()
            }
        }
    }
}

struct SimpleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButtonView()
    }
}
