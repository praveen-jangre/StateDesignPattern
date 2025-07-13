//
//  ContentView.swift
//  ATMMachine
//
//  Created by Praveen Jangre on 12/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            startATMMachine()
        }
    }
}

#Preview {
    ContentView()
}
