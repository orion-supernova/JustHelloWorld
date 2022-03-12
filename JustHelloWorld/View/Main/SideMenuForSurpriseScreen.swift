//
//  SideMenuForSurpriseScreen.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 10.02.2022.
//

import SwiftUI
import AVKit

struct SideMenuForSurpriseScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var viewmodel: SurpriseScreenViewModel

    var body: some View {
        ZStack {
            if viewmodel.surpriseObject.isInverted {
                Color.black
                    .ignoresSafeArea()
            } else {
                Color.matrixGreen
                    .ignoresSafeArea()
            }
            VStack(spacing: 10) {
                Button {
                    withAnimation {
                        viewRouter.currentPage = .mainScreen
                    }
                } label: {
                    Text("Go Back")
                        .foregroundColor(viewmodel.surpriseObject.isInverted ? Color.matrixGreen : Color.black)
                        .font(.system(size:20, weight: .bold, design: .monospaced))
                }
                Button {
                    withAnimation {
                        viewRouter.currentPage = .matrixRainView
                    }
                } label: {
                    Text("More!")
                        .foregroundColor(viewmodel.surpriseObject.isInverted ? Color.matrixGreen : Color.black)
                        .font(.system(size:20, weight: .bold, design: .monospaced))
                }
            }
        }
        .onTapGesture {
            viewmodel.surpriseObject.isInverted.toggle()
        }
        .frame(width: 220, height: getRect().maxY)
        .onTapGesture {
        }
    }
}

struct SideMenuForSurpriseScreen_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuForSurpriseScreen(viewmodel: SurpriseScreenViewModel())
    }
}
