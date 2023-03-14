//
//  DateView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 3/12/23.
//

import SwiftUI

struct DateView: View {
    
    let currentDate = Date()
    let calendar = Calendar.current
    
    var body: some View {
        VStack {
            Text("\(formatDate(date: currentDate))")

        }
        
            .font(Font.custom("Hind-SemiBold", size: 40))
            .foregroundColor(.white)
    }
}

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        return dateFormatter.string(from: date)

}







struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GradientBackgroundView()
            DateView()
        }
    }
}
