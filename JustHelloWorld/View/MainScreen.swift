//
//  MainScreen.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

struct MainScreen: View {
    @State private var xOffset = CGFloat.zero
    @State private var defaultOffset = CGFloat.zero

    init() {
          UIScrollView.appearance().bounces = false
       }

    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { value in
                    HStack(spacing: 0) {
                        SideMenu()
                            .frame(width: 200, height: getRect().maxY, alignment: .leading)
                            .id("sidemenu")
                        HelloWorldView()
                            .frame(width: getRect().maxX, height: getRect().maxY)
                            .id("helloworldview")
                    }
                    .onAppear {
                        value.scrollTo("helloworldview")
                    }
                }
            }
            .frame(width: getRect().maxX, height: getRect().maxY, alignment: .center)
            .ignoresSafeArea()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
