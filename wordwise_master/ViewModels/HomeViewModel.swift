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
        
        
        func swipeLeft() {
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
        
    
        func swipeRight() {
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
