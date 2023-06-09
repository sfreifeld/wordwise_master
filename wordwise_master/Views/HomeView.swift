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

                DateView()
                    .minimumScaleFactor(0.5)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.03)
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
       
        }  .navigationViewStyle(StackNavigationViewStyle())
    } 
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
