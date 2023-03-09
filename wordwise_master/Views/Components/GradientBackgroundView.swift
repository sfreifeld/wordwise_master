//
//  GradientBackgroundView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(colors: [Color("Lilac"), Color("LightPink")]), startPoint: .top, endPoint: .bottom)
            )
            .ignoresSafeArea()
    }
}

struct GradientBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroundView()
    }
}
