//
//  LibraryView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var libraryViewModelTest: LibraryViewModelTest
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        LibraryNavigationView(libraryViewModelTest: libraryViewModelTest, viewModel: viewModel)
        
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(libraryViewModelTest: LibraryViewModelTest(), viewModel: HomeViewModel())
    }
}
