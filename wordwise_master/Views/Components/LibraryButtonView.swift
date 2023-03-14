//
//  LibraryButtonView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI

struct LibraryButtonView: View {

    var body: some View {
        
            Text("     LIBRARY     ")
                .padding()
                .background(Color("Indigo"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .buttonStyle(SquishButtonStyle(fadeOnPress: false))
                .font(Font.custom("Montserrat-Bold", size: 20))
                .foregroundColor(.white)

            }
        }

struct LibraryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryButtonView()
    }
}
