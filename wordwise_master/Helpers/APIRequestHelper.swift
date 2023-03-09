//
//  APIRequestHelper.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//
import Alamofire
import Foundation

public func getFormattedDate(date: Date = Date()) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyyMMdd"
        return dateformat.string(from: date)
}


public func endpoint() -> URL {
    let formatDate = getFormattedDate()
    let endpoint = "wordOfTheDay?date=\(formatDate)&api_key=spsyjnwus774vlciyfkr2mx8a34rv5xy771ig1xg22v6robko"
    return .makeForEndpoint(endpoint)
    }


extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        URL(string: "https://api.wordnik.com/v4/words.json/\(endpoint)")!
    }
}

public struct API {
    public static func getWordOfTheDay(completion: @escaping(_ result: Result<WordOfTheDayAPI, Error>) -> Void) {
        
        let endpoint = endpoint()
        
        AF.request(endpoint)
            .responseDecodable(of: WordOfTheDayAPI.self) { response in
                guard let wordOfTheDay = response.value else {
                    print("Failure! \(endpoint) - \(String(describing: response.error))")
                    return completion(.failure(ServiceError.serverError))
                }
                
                print("Success! \(endpoint)")
                completion(.success(wordOfTheDay))
            }
    }
}

public enum ServiceError: Error {
    case badURL
    case serverError
}
