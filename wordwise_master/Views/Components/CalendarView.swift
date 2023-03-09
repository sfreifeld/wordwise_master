//
//  CalendarView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var viewModel: CalendarViewModel
    let daysOfWeek = ["S", "M", "T", "W", "T","F","S"]
    let calendar = Calendar.current
    
    

       var body: some View {
           VStack {
            HStack(spacing: 25){
             ForEach(0..<7) { index in
                 HStack{
                     VStack {
                         Text(self.daysOfWeek[index])
                             .font(Font.custom("Hind-Regular", size: 18))
                             .foregroundColor(.white)

                         ZStack {
                            // Display a circle around today's day
                            if viewModel.daysOfMonth[index] == calendar.component(.day, from: Date()) {
                               Circle()
                                  .fill(Color.indigo)
                                  .frame(width: 30, height: 30)
                                
                            }
                             else {
                                 Circle()
                                    .fill(Color.clear)
                                    .frame(width: 30, height: 30)
                             }

                             Text("\(viewModel.daysOfMonth[index])")
                                 .font(Font.custom("Hind-Regular", size: 18))
                                 .foregroundColor(.white)
                         }
                         
                     }
                 }
                }
            }
               

               
               GeometryReader { geometry in
                Color.white
                    .frame(width: geometry.size.width - 40, height: 1 / UIScreen.main.scale)
                    .offset(x: 20, y: 0)
               }
           }.frame(height:100)
           //.border(.red)
           
       }
    
    }
struct WeeklyCalendar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
        GradientBackgroundView()
        CalendarView(viewModel: CalendarViewModel())
        }
    }
}



