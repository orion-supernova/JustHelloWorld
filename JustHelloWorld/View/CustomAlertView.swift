//
//  CustomAlertView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 10.02.2022.
//

import SwiftUI

struct CustomAlertView: View {
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()

            VStack {
                HStack {
                    Text("hebele hübele emin misin")
                        .padding()
                }
                .frame(maxWidth: .infinity)

                Divider()
                HStack {
                    ZStack {
                        Color.clear
                        Spacer()
                        Button {

                        } label: {
                            Text("Cancel")
                        }
                    }
                    .frame(maxHeight: 50)
                    .cornerRadius(5)
                    Divider()
                        .frame(width: 5, height: 50)
                    ZStack {
                        Color.clear
                        Button {

                        } label: {
                            Text("OK")
                        }
                        .padding()
                    }
                    .frame(maxHeight: 50)
                    .cornerRadius(5)

                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView()
    }
}
