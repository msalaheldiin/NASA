//
//  NetworkManager.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 13/04/2022.
//

import Foundation

enum AppError: Error {
    case _404 , _500, ConnectionFailures, parsingError(String)
}

class NetworkManager {
    static let shared =  NetworkManager.init()
    private init() {}
    typealias completionType = ((Result<Decodable,AppError>)->())
    typealias errorType = ((Error?)->())
    
    func getErrorFromCode(statusCode: Int) -> AppError {
        if statusCode == 404 {
            return ._404
        } else if statusCode == 500  {
            return ._500
        } else {
            return .ConnectionFailures
        }
    }
    
    func fetchData<T>(withUrlRequest urlRequest: URLRequest, andResponceType responceType: T.Type, andCompletion completion: @escaping ((Result<T,AppError>)->()) ) where T : Decodable {
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response
                                                                   , error) in
            if let _ = error  {
                DispatchQueue.main.async {
                    completion(.failure(.ConnectionFailures))
                }
            }
            else {
                if let data = data , let response = response as? HTTPURLResponse {
                    guard response.statusCode == 200 else {
                        completion(.failure(self.getErrorFromCode(statusCode: response.statusCode)))
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let result  = try decoder.decode(responceType, from: data)
                        DispatchQueue.main.async {
                            completion(.success(result))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(.parsingError(error.localizedDescription)))
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completion(.failure(.ConnectionFailures))
                    }
                }
            }
        }
        task.resume()
    }
}
