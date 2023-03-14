//
//  WordModel.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 3/11/23.
//

import Foundation


struct Word: Hashable, Encodable, Comparable {
    
    
    var word: String
    var wordDescription: String
    var wordPartofSpeech: String
    var wordExample: String
    
    static func < (lhs: Word, rhs: Word) -> Bool {
        return lhs.word < rhs.word
    }
}
