//
//  SideMenu.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

struct SideMenu: View {
    @State var randomBGColor = false
    @State var randomTextColor = false
    @State var randomSideMenuBGColor = false

    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()

            VStack {
                Text("Change Color Settings")
                    .font(.system(size:20, weight: .bold, design: .monospaced))
                Spacer()
                    .frame(width: getRect().maxX, height: 50)
                Toggle("Background Color", isOn: $randomBGColor)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)
                Toggle("Text Color", isOn: $randomTextColor)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)
                Toggle("SideMenu Background Color", isOn:
                        $randomSideMenuBGColor)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)


            }
            .frame(width: 190, height: getRect().maxY)
            .padding(.horizontal)
        }
        .frame(width: 200, height: getRect().maxY)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
