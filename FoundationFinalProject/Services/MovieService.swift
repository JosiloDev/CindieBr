import Foundation

struct MovieService{
    private let baseURL = "https://themoviedb.org"
    private let apiKey = "3203e8a89f3680d3a63c58f07c57c7e6"


private func performRequest(endpoint: String, queries: [URLQueryItem] = []) async throws -> [MovieDTO] {
    guard var components = URLComponents(string: "\(baseURL)\(endpoint)") else {
        throw NetworkError.invalidURL
        }
    
    let userLanguage = Locale.preferredLanguages.first ?? "en-US"
    
    var allQueries = queries
    allQueries.append(URLQueryItem(name: "api_key", value: apiKey))
    allQueries.append(URLQueryItem(name: "language", value: userLanguage))
    
    
    
    }
}

