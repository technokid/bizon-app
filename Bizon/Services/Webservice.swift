//
//  Webservice.swift
//  Bizon
//
//  Created by Serhii Dudik on 29.07.2024.
//

import Foundation


enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let phone: String
    let password: String
}

struct RegisterRequestBody: Codable {
    let phone: String
    let password: String
    let name: String
    let smsCode: String
    let verifyToken: String
}

struct LoginResponse: Codable {
    let accessToken: String?
    let tokenType: String?
    let expiresAfter: String?
}

class Webservice {
        
    func getMe(token: String, completion: @escaping (Result<[Account], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://api.bizonhub.dev/api/me") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let account = try? JSONDecoder().decode([Account].self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(account))
            
            
        }.resume()
        
        
    }
    

    func login(phone: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {

        guard let url = URL(string: "https://api.bizonhub.dev/api/auth") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }

        let body = LoginRequestBody(phone: phone, password: password)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }

            //try! JSONDecoder().decode(LoginResponse.self, from: data)

            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }

            guard let token = loginResponse.accessToken else {
                completion(.failure(.invalidCredentials))
                return
            }

            completion(.success(token))

        }.resume()

    }


    func signUp(phone: String completion: @escaping (Result<String, AuthenticationError>) -> Void) {

        guard let url = URL(string: "https://api.bizonhub.dev/api/sign-up") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }

        let body = LoginRequestBody(phone: phone, password: password)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }

            //try! JSONDecoder().decode(LoginResponse.self, from: data)

            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }

            guard let token = loginResponse.accessToken else {
                completion(.failure(.invalidCredentials))
                return
            }

            completion(.success(token))

        }.resume()

    }

}
