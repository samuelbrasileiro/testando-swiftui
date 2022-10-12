//
//  StarAnimatedView.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 11/10/22.
//

import SwiftUI

struct StarAnimatedView: View {
    
    var body: some View {
        SandboxView(width: UIScreen.main.bounds.width - 40,
                    height: 400)
        
    }
}

struct StarAnimatedView_Previews: PreviewProvider {
    static var previews: some View {
        StarAnimatedView()
    }
}
