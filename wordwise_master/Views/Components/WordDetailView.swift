//
//  WordDetailView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 3/11/23.
//

import SwiftUI


struct WordDetail: View {
    let word: Word
    @ObservedObject var libraryViewModelTest: LibraryViewModelTest
    @State private var showDetail: Bool = false
    @ObservedObject var viewModel: HomeViewModel
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(word.word)
                .font(Font.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Color("Indigo"))
            if showDetail {
                VStack(alignment: .leading) {
                Text(word.wordPartofSpeech)
                Text(word.wordDescription)
            }
        
                    .font(Font.custom("Hind-Regular", size: 18))
                    .foregroundColor(Color("Indigo"))
            }
        }
        .padding()
        .onTapGesture {
            withAnimation {
                showDetail.toggle()
            }
        }
    }
}









struct WordDetailView: View {
    
    
    @State private var isEditing = false
    @State private var testlistwords: [String] = ["gargantuan","kerfluffle", "katzenjammer"]
    @ObservedObject var libraryViewModelTest: LibraryViewModelTest
    @State private var showDetail: Bool = false
    @ObservedObject var viewModel: HomeViewModel
    
    
    
    
    var body: some View {
        
        
        VStack {
            List {
                //ForEach(libraryViewModelTest.savedWords.sorted(), id: \.self) { word in
                ForEach(viewModel.testWordSet.sorted(), id: \.self) { word in
                    Text("\(word.word): \(word.wordPartofSpeech)- \(word.wordDescription)")
                    
                    
                }                        .font(Font.custom("Hind-Regular", size: 18))
                    .foregroundColor(Color("Indigo"))
                    .listRowBackground(Color.white.opacity(0.5))
            }.padding()
        } .frame(width: UIScreen.main.bounds.width * 0.92)
    }
}


struct WordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GradientBackgroundView()
            WordDetail(word: Word(word: "firstWord", wordDescription: "This is a definition of the word", wordPartofSpeech: "noun", wordExample: "This is an example of a sentence using the word"), libraryViewModelTest: LibraryViewModelTest(), viewModel: HomeViewModel())
          //  WordDetailView(libraryViewModelTest: LibraryViewModelTest(), viewModel: HomeViewModel())
        }
    }
}
