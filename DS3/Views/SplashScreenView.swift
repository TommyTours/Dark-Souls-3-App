//
//  SplashScreenView.swift
//  DS3
//
//  Created by Tom Clifford on 02/05/2021.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View
    {
        VStack
        {
            Spacer()
            Image("DS3_logo")
                .resizable()
                .scaledToFit()
            Spacer()
        }.background(Color(.black))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
