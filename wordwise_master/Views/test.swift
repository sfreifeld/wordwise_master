//
//  test.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 3/10/23.
//

import SwiftUI

struct HomeViewtest: View {
    @StateObject var viewModel = HomeViewModel()
    @StateObject var libraryViewModelTest = LibraryViewModelTest()
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack {
                CalendarView(viewModel: CalendarViewModel())
                    .padding([.top,.bottom], UIScreen.main.bounds.height * 0.04)
                WordCardView(viewModel: viewModel)
                    .padding([.bottom], UIScreen.main.bounds.height * 0.03)
                ButtonsView(viewModel: viewModel, libraryViewModelTest: libraryViewModelTest)
                    .padding([.bottom], UIScreen.main.bounds.height * 0.03)
                NavigationLink(destination: LibraryView(libraryViewModelTest: libraryViewModelTest, viewModel: viewModel).navigationBarBackButtonHidden(true)) {
                    LibraryButtonView()
                }
                .buttonStyle(SquishButtonStyle())
            }
        }
    }
}

struct HomeViewtest_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewtest()
    }
}
