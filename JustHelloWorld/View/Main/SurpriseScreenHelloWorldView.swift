//
//  SurpriseScreenHelloWorldView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 10.02.2022.
//

import SwiftUI
import AVFoundation

struct SurpriseScreenHelloWorldView: View {
    @State var mainText = "5"
    @State var countdown = 4
    @State var fontSize: CGFloat = 60
    @State var invertedColors = false
    @State var viewTapgestureEnabled = false
    @State var isTexOnTheLeft = false

    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var viewmodel: SurpriseScreenViewModel

    var body: some View {
        ZStack {
            if viewmodel.surpriseObject.isInverted {
                Color.matrixGreen
                    .ignoresSafeArea()
            } else {
                Color.black
                    .ignoresSafeArea()
            }

            VStack {
                Spacer()
                HStack {
                    Text(mainText)
                        .foregroundColor(viewmodel.surpriseObject.isInverted ? Color.black : Color.matrixGreen)
                        .padding()
                        .font(.system(size: fontSize, weight: .bold, design: .monospaced))
                        .scaledToFit()
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .onAppear(perform: {
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                                mainText = "\(countdown)"
                                if countdown > 0 {
                                    countdown -= 1
                                } else {
                                    timer.invalidate()
                                    fontSize = 30
                                    mainText = ""
                                    var count = 0
                                    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                                        if count < 3 {
                                            mainText += "."
                                            count += 1
                                        } else {
                                            timer.invalidate()
                                            count = 0
                                            var target = 0
                                            mainText = ""
                                            fontSize = 20
                                            isTexOnTheLeft = true
                                            let text = "Welcome to the Rabbit Hole."
                                            var charArray = [String]()
                                            for char in text {
                                                target += 1
                                                charArray.append("\(char)")
                                            }
                                            Timer.scheduledTimer(withTimeInterval: 0.12, repeats: true) { timer in
                                                if count < target {
                                                    mainText += charArray[count]
                                                    count += 1
                                                } else {
                                                    count = 0
                                                    charArray = []
                                                    timer.invalidate()
                                                    isTexOnTheLeft = false
                                                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                                                        fontSize = 80
                                                        mainText = "Hello, World!"
                                                        timer.invalidate()
                                                        viewTapgestureEnabled = true
                                                        viewmodel.surpriseObject.isTouchEnabledForTopView = true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        })
                    if isTexOnTheLeft {
                        Spacer()
                    }
                }
                Spacer()
            }
        }
        .onTapGesture {
            if viewTapgestureEnabled {
                viewmodel.surpriseObject.isInverted.toggle()
            }
        }
    }

}

struct SideMenuHelloWorldScreen_Previews: PreviewProvider {
    static var previews: some View {
        SurpriseScreenHelloWorldView(viewmodel: SurpriseScreenViewModel())
    }
}
