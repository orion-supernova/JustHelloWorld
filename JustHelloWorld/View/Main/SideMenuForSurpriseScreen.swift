//
//  SideMenuForSurpriseScreen.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 10.02.2022.
//

import SwiftUI

struct SideMenuForSurpriseScreen: View {
    @EnvironmentObject var viewrouter: ViewRouter
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
            Button {
                withAnimation {
                    viewrouter.currentPage = .mainScreen
                }
            } label: {
                Text("Go Back")
                    .foregroundColor(viewmodel.surpriseObject.isInverted ? Color.matrixGreen : Color.black)
                    .font(.system(size:20, weight: .bold, design: .monospaced))
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
