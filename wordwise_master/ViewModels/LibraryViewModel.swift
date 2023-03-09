//
//  LibraryViewModel.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import Foundation

class LibraryViewModelTest: ObservableObject {
    
    @Published var savedWords: Set = Set<String>()
    
    //init() {
      //  if let savedWordsData = UserDefaults.standard.data(forKey: "savedWords"),
        //   let savedWords = try? JSONDecoder().decode([String].self, from: savedWordsData) {
          //  self.savedWords = savedWords
        //
        
        
        
        func saveWord(_ word: String) {
            // Add word to savedWords array
            savedWords.insert(word)
            
            // Save updated savedWords array to UserDefaults
            let savedWordsData = try? JSONEncoder().encode(savedWords)
            UserDefaults.standard.set(savedWordsData, forKey: "savedWords")
        }
        
        func deleteWord(_ word: String) {
            // Remove word from savedWords array
             savedWords.remove(word)
                
                // Save updated savedWords array to UserDefaults
                let savedWordsData = try? JSONEncoder().encode(savedWords)
                UserDefaults.standard.set(savedWordsData, forKey: "savedWords")
            
        }
    }
    
