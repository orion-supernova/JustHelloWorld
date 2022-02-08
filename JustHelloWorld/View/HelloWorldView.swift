//
//  HelloWorldView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

struct HelloWorldView: View {
    @State var color1 = Color.random
    @State var color2 = Color.random

    let textArray = [
        "Hello, world!","","","","","","","","","","","","","","","",
    ]
    
    var body: some View {
        ZStack {
            color1
                .ignoresSafeArea()

            Text("Hello, world!")
                .foregroundColor(color2)
                .padding(5)
                .font(.system(size: 80, weight: .bold, design: .monospaced))
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        }
        .onTapGesture {
            color1 = Color.init(hexString: "#002828")
            color2 = Color.random
        }
        .onTapGesture(count: 3) {
            print("TRIPLE TAP")
        }
    }
}

struct HelloWorldView_Previews: PreviewProvider {
    static var previews: some View {
        HelloWorldView()
    }
}
