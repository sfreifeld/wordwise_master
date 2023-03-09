//
//  HomeView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @StateObject var libraryViewModelTest = LibraryViewModelTest()
    
    var body: some View {
        NavigationView {
        ZStack {
            GradientBackgroundView()
            VStack {
                CalendarView(viewModel: CalendarViewModel())
                    .padding([.top,.bottom], 30)
                WordCardView(viewModel: viewModel)
                    .padding([.bottom], 20)
                ButtonsView(viewModel: viewModel, libraryViewModelTest: libraryViewModelTest)
                    .padding([.bottom], 20)
                NavigationLink(destination: LibraryView(libraryViewModelTest: libraryViewModelTest).navigationBarBackButtonHidden(true)) {
                    LibraryButtonView()
                }
                .buttonStyle(SquishButtonStyle())
            }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
