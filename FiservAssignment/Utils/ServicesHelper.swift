//
//  ServicesHelper.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

import Foundation

class ServicesHelper {
    
    static let shared = ServicesHelper()
    
    func validadeResponse(_ response: URLResponse?) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIErrors.unknownError
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return
        case 401:
            throw APIErrors.unauthorized
        case 403:
            throw APIErrors.forbidden
        case 404:
            throw APIErrors.notFound
        case 500...599:
            throw APIErrors.serverError(statusCode: httpResponse.statusCode)
        default:
            throw APIErrors.unknownError
        }
    }
    
    func getRequestWithAuth(forUrl url: URL, method: HTTPRequestMethods) -> URLRequest {
        let authString = "Advantage:mobileAssignment"
        let base64Auth = Data(authString.utf8).base64EncodedString()
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("Basic \(base64Auth)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    
}
