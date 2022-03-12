//
//  LoaderView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
                .opacity(0.25)

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.matrixGreen))
                .scaleEffect(3)
        }
        .zIndex(5)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
