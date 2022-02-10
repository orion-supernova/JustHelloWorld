//
//  SurpriseScreenHelloWorldView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 10.02.2022.
//

import SwiftUI

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
                                    for i in "..." {
                                        mainText += "\(i)"
                                        RunLoop.main.run(mode: .default, before: Date()+0.3)
                                    }
                                    isTexOnTheLeft = true
                                    fontSize = 20
                                    mainText = ""
                                    for i in "Welcome to the Rabbit Hole." {
                                        mainText += "\(i)"
                                        RunLoop.main.run(mode: .default, before: Date()+0.12)
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                                        mainText = ""
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                                        mainText = "Hello, World!"
                                        fontSize = 80
                                        isTexOnTheLeft = false
                                        viewTapgestureEnabled = true
                                        viewmodel.surpriseObject.isTouchEnabledForTopView = true
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
