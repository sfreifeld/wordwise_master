//
//  HomeViewModel.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import Foundation
import AVFoundation
import SwiftUI




class HomeViewModel: ObservableObject {
    
    @Published var wordStatus: Status = .unset
    @Published var showMessage: Bool = false
    @Published var wordPosition: CGSize = .zero
    
    

    
    @Published var word = ""
    @Published var wordDescription = ""
    @Published var wordPartofSpeech = ""
    @Published var wordExample = ""
    
    @Published var savedWords: Set = Set<Word>()
    
    
     var wordStruct: Word {
            return Word(word: word, wordDescription: wordDescription, wordPartofSpeech: wordPartofSpeech, wordExample: wordExample)
        }
    
    
    var word1 = Word(word: "firstWord", wordDescription: "This is a definition of the word", wordPartofSpeech: "noun", wordExample: "This is an example of a sentence using the word")
    
    var testWordSet: Set<Word> = [Word(word: "firstWord", wordDescription: "This is a definition of the word", wordPartofSpeech: "noun", wordExample: "This is an example of a sentence using the word"), Word(word: "secondWord", wordDescription: "This is a definition of the word", wordPartofSpeech: "noun", wordExample: "This is an example of a sentence using the word")]
    
    func fetchData(){
        print("WordOfTheDayViewModel: fetchData")
        
        API.getWordOfTheDay() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let wordOfTheDayResponse):
                
                self.word = wordOfTheDayResponse.word ?? ""
                self.wordDescription = wordOfTheDayResponse.definitions?.first?.text ?? ""
                self.wordPartofSpeech = wordOfTheDayResponse.definitions?.first?.partOfSpeech ?? ""
                self.wordExample = wordOfTheDayResponse.examples?.first?.text ?? ""
                
                
            case .failure:
                break
            }
            
        }
    }
        
        

    
    func swipeLeft(_ word:Word) {
        savedWords.remove(word)
        let savedWordsData = try? JSONEncoder().encode(savedWords)
        UserDefaults.standard.set(savedWordsData, forKey: "savedWords")
        wordStatus = .trashed
        withAnimation  {
                wordPosition = CGSize(width: -400, height: 0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                self.showMessage = true
                }
            }
        }
    
    
    
    
    
    
    
    
        func swipeRight(_ word:Word) {
            savedWords.insert(word)
            let savedWordsData = try? JSONEncoder().encode(savedWords)
            UserDefaults.standard.set(savedWordsData, forKey: "savedWords")
            wordStatus = .saved
            withAnimation  {
                wordPosition = CGSize(width: 400, height: 0)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    self.showMessage = true
                }
            }
        }
        
        enum Status {
            case unset
            case saved
            case trashed
        }
        
    }
