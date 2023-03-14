//
//  testList.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 3/13/23.
//

import SwiftUI

struct testList: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @ObservedObject var libraryViewModelTest: LibraryViewModelTest
    
    
    var body: some View {
        VStack {
            ForEach(Array(viewModel.testWordSet), id: \.self) { word in
                WordDetail(word: word, libraryViewModelTest: libraryViewModelTest, viewModel: viewModel)
            }
        }
             }
        }


struct testList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GradientBackgroundView()
            testList(viewModel: HomeViewModel(), libraryViewModelTest: LibraryViewModelTest())
        }
    }
}
