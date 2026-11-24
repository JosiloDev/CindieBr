

import Foundation

struct MovieService {
    private let baseURL = "https://themoviedb.org"
    private let apiKey = "3203e8a89f3680d3a63c58f07c57c7e6"

    func fetchPopular() async throws -> [MovieDTO] {
        return try await performRequest(endpoint: "/movie/popular")
    }

    func fetchTrending() async throws -> [MovieDTO] {
        return try await performRequest(endpoint: "/trending/movie/week")
    }

    func fetchRecent() async throws -> [MovieDTO] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())
        
        let queries = [
            URLQueryItem(name: "sort_by", value: "primary_release_date.desc"),
            URLQueryItem(name: "primary_release_date.lte", value: today),
            URLQueryItem(name: "vote_count.gte", value: "100")
        ]
        return try await performRequest(endpoint: "/discover/movie", queries: queries)
    }

    func fetchMoviesByCountry(countryCode: String = "BR") async throws -> [MovieDTO] {
        let query = [URLQueryItem(name: "with_origin_country", value: countryCode)]
        return try await performRequest(endpoint: "/discover/movie", queries: query)
    }

    func fetchMoviesByGenre(genreId: Int) async throws -> [MovieDTO] {
        let query = [URLQueryItem(name: "with_genres", value: "\(genreId)")]
        return try await performRequest(endpoint: "/discover/movie", queries: query)
    }

    func fetchMoviesByDecade(startYear: Int) async throws -> [MovieDTO] {
        let endYear = startYear + 9
        let queries = [
            URLQueryItem(name: "primary_release_date.gte", value: "\(startYear)-01-01"),
            URLQueryItem(name: "primary_release_date.lte", value: "\(endYear)-12-31"),
            URLQueryItem(name: "sort_by", value: "popularity.desc")
        ]
        return try await performRequest(endpoint: "/discover/movie", queries: queries)
    }

    func fetchOscarWinners() async throws -> [MovieDTO] {
        return try await performRequest(endpoint: "/list/28")
    }
    private func performRequest(endpoint: String, queries: [URLQueryItem] = []) async throws -> [MovieDTO] {
        guard var components = URLComponents(string: "\(baseURL)\(endpoint)") else {
            throw NetworkError.invalidURL
        }
        
        let userLanguage = Locale.preferredLanguages.first ?? "en-US"
        
        var allQueries = queries
        allQueries.append(URLQueryItem(name: "api_key", value: apiKey))
        allQueries.append(URLQueryItem(name: "language", value: userLanguage))
        
        components.queryItems = allQueries
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidURL
        }
        
        let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        return decodedResponse.allMovies
    }
}
