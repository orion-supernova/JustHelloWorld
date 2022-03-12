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
    @State var lineLimit = 0

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
                        .minimumScaleFactor(0.01)
                        .lineLimit(lineLimit)
                        .multilineTextAlignment(.leading)
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
                                            fontSize = 25
                                            mainText += "."
                                            count += 1
                                        } else {
                                            timer.invalidate()
                                            count = 0
                                            var target = 0
                                            mainText = ""
                                            fontSize = getRect().width == getSmallDeviceWidth() ? 16 : 20
                                            isTexOnTheLeft = true
                                            lineLimit = 3
                                            let text = "So you are looking for the Rabbit Hole, huh?"
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
                                                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                                                        fontSize = 80
                                                        isTexOnTheLeft = false
                                                        lineLimit = 1
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
