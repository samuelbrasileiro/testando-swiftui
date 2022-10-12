//
//  BindingExample.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 12/10/22.
//

import SwiftUI

struct CountButton: View {
    @Binding var count: Int
    
    var body: some View {
        Button("\(count) vezes") {
            count += 1
        }
    }
}

struct CounterView: View {
    @State private var swiftCount: Int = 0
    
    var body: some View {
        VStack {
            Text("Quantas vezes tocou no botão:")
            CountButton(count: $swiftCount)
        }
    }
}

struct BindingExample_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
