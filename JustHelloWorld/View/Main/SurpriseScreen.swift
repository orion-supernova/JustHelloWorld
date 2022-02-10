//
//  SurpriseScreen.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 10.02.2022.
//

import SwiftUI

struct SurpriseScreen: View {

    let timer = Timer.publish(every: 1,tolerance: 5, on: .main, in: .default).autoconnect()
    @State var mainText = "5"
    @State var countdown = 4
    @State var font: CGFloat = 60

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            Text(mainText)
                .foregroundColor(Color.init(hexString: "00ff2b"))
                .font(.system(size: font))
                .onReceive(timer) { _ in
                    mainText = "\(countdown)"
                                if countdown > 0 {
                                    countdown -= 1
                                } else {
                                    mainText = ""
                                    for i in "..." {
                                        mainText += "\(i)"
                                        RunLoop.main.run(until: Date()+0.3)
                                    }
                                    font = 20
                                    mainText = ""
                                    for i in "Welcome to the Rabbit Hole." {
                                        mainText += "\(i)"
                                        RunLoop.main.run(until: Date()+0.12)
                                    }

                                    mainText = ""

                                }
                            }
        }
    }
}

struct SurpriseScreen_Previews: PreviewProvider {
    static var previews: some View {
        SurpriseScreen()
    }
}
