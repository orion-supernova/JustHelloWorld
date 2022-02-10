//
//  SurpriseScreen.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 10.02.2022.
//

import SwiftUI

struct SurpriseScreen: View {

    @State private var xOffset = CGFloat.zero
    @State private var defaultOffset = CGFloat.zero

    @State var randomBGColor = true
    @State var randomTextColor = true
    @State var randomLanguage  = false
    @State var isAutomatic  = false

    @StateObject var viewmodel = SurpriseScreenViewModel()

    init() {
          UIScrollView.appearance().bounces = false
       }

    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { value in
                    HStack(spacing: 0) {
                        SideMenuForSurpriseScreen(viewmodel: viewmodel)
                            .frame(width: 220, height: getRect().maxY, alignment: .leading)
                            .id("sideMenuForSurpriseScreen")
                        SurpriseScreenHelloWorldView(viewmodel: viewmodel)
                            .frame(width: getRect().maxX, height: getRect().maxY)
                            .id("surpriseScreenHelloWorldView")
                    }
                    .onAppear {
                        value.scrollTo("surpriseScreenHelloWorldView")
                    }
                }
            }
            .allowsHitTesting(viewmodel.surpriseObject.isTouchEnabledForTopView)
            .frame(width: getRect().maxX, height: getRect().maxY, alignment: .center)
            .ignoresSafeArea()
        }
    }
}


struct SurpriseScreen_Previews: PreviewProvider {
    static var previews: some View {
        SurpriseScreen()
    }
}
