//
//  StarView.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 12/10/22.
//

import SwiftUI

struct StarView: View {
    let star: Star
    
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: star.size,
                   height: star.size)
            .foregroundColor(.red)
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(star: .init())
    }
}
