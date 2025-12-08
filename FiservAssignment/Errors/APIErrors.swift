//
//  APIErrors.swift
//  FiservChallenge
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

enum APIErrors: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(statusCode: Int)
    case networkError
    case unauthorized
    case forbidden
    case notFound
    case unknownError
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data"
        case .decodingError:
            return "Decoding error"
        case .serverError(let code):
            return "Server error. status \(code)"
        case .networkError:
            return "Network error"
        case .unauthorized:
            return "Request unauthorized"
        case .forbidden:
            return "Request not allowed"
        case .notFound:
            return "Data not found"
        case .unknownError:
            return "Unknown error"
        }
    }
    
}
