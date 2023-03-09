//
//  LibraryView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var libraryViewModelTest: LibraryViewModelTest
    var body: some View {
        LibraryNavigationView(libraryViewModelTest: libraryViewModelTest)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(libraryViewModelTest: LibraryViewModelTest())
    }
}
