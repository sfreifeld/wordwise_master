//
//  APIRequest.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import Foundation

public struct WordOfTheDayAPI: Decodable {
    public let word: String?
    public let definitions: [DefinitionAPI]?
    public let examples: [ExampleAPI]?
    
    public init(
        word: String?,
        definitions: [DefinitionAPI]?,
        examples: [ExampleAPI]?
    ) {
        self.word = word
        self.definitions = definitions
        self.examples = examples
    }
}

public struct DefinitionAPI: Decodable {
    
    public let text: String
    public let partOfSpeech: String?

    
    public init(
        text: String,
        partOfSpeech: String?

    ) {
        self.text = text
        self.partOfSpeech = partOfSpeech
    }
}

public struct ExampleAPI: Decodable {
    
    public let text: String

    
    public init(
        text: String

    ) {
        self.text = text
    }
}
