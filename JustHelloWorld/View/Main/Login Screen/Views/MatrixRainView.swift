//
//  MatrixRainView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 6.03.2022.
//

import SwiftUI

struct MatrixRainView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            HStack {
                ForEach(1...Int(size.width / 20), id: \.self) { _ in
                    MatrixRainCharacters(size: size)
                }
            }
            .padding(.horizontal)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                    viewRouter.currentPage = .rabbitHoleHub
                }
            }
        })
    }
}

struct MatrixRainCharacters: View {
    var size: CGSize
    @State var startAnimation = false
    @State var random = 0
    var fontSize: Int = 0


    var body: some View {
        let randomHeight: CGFloat = .random(in: (size.height)...size.height*3)

        VStack {
            //MARK: - Iterating String
            ForEach(0..<constant.count, id: \.self) { index in
                let character = Array(constant)[getRandomIndex(index: index)]
                Text(String(character))
                    .font(.custom("", size: 20))
                    .foregroundColor(Color("Green"))
            }
        }
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect(), perform: { _ in
            random = Int.random(in: 0..<constant.count)
        })
        //MARK: - Fade Color
        .mask(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        .clear,
                        .black,
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(height: size.height)
            //MARK: - Animating
                .offset(y: startAnimation ? size.height : -randomHeight)
        }
        .onAppear {
            //MARK: - Moving slowly down onappear
            withAnimation(.linear(duration: 5).delay(.random(in: 0...2)).repeatForever(autoreverses: false)) {
                startAnimation = true
            }
        }
    }

    //MARK: - Changing characters randomly
    func getRandomIndex(index: Int) -> Int {
        // To avoid index out of bounds
        let max = constant.count - 1
        if index + random > max {
            if index - random < 0 {
                return index
            }
            return index - random
        } else {
            return index + random
        }
    }


}

struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixRainView()
    }
}

// MARK: - Random Characters
let constant = "ﾊﾐﾋｰｳｼﾅﾓﾆｻﾜﾂｵﾘｱﾎﾃﾏｹﾒｴｶｷﾑﾕﾗｾﾈｽﾀﾇﾍｦｲｸｺｿﾁﾄﾉﾌﾔﾖﾙﾚﾛﾝ"
