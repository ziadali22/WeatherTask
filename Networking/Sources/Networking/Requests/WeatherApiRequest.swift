//
//  WeatherApiRequest.swift
//  
//
//  Created by ziad on 22/03/2023.
//

import Foundation
import Alamofire


/// Represents Fakestore.com Endpoint
///
struct WeatherApiRequest: URLRequestConvertible {
    
    /// HTTP Request Method
    ///
    let method: HTTPMethod

    /// URL Path
    ///
    let path: String

    /// Parameters
    ///
    let parameters: [String: Any]
    
    /// Designated Initializer.
    ///
    /// - Parameters:
    ///     - method: HTTP Method we should use.
    ///     - path: RPC that should be called.
    ///     - parameters: Collection of Key/Value parameters, to be forwarded to the Jetpack Connected site.
    ///
    init(method: HTTPMethod, path: String, parameters: [String: Any]? = nil) {
        self.method = method
        self.path = path
        self.parameters = parameters ?? [:]
    }
    
    private var queryParameters: [URLQueryItem] {
        var queryParameters = [URLQueryItem]( )
        queryParameters.append(URLQueryItem(name: "appid", value: Settings.apiKey))
        return queryParameters
    }
    
    var url: URL? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = Settings.weatherApiBaseURL
        components.path = path
        components.queryItems = queryParameters
        return components.url
    }
    
    /// Returns a URLRequest instance reprensenting the current FakeStore Request.
    ///
    func asURLRequest() throws -> URLRequest {
        let url = url!
        let request = try URLRequest(url: url, method: method, headers: nil)
        return try encoder.encode(request, with: parameters)
    }
}

// MARK: - FakeStore Request: Internal
//
private extension WeatherApiRequest {
    
    /// Returns the Parameters Encoder
    ///
    var encoder: ParameterEncoding {
        return method == .get ? URLEncoding.queryString : URLEncoding.httpBody
    }
}
