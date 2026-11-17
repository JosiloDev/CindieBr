import Foundation

struct MovieResponse: Codable {
    let totalPages: Int
    let results: [MovieDTO]
    let page: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey{
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
        case page
    }
}

struct MovieDTO: Codable, Identifiable {
    let id : Int
    let title: String
    let releaseDate: String?
    let posterPath : String?
    let overview: String
    let voteAverage: Double
    let genreIds: [Int]
    var director: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
    }
}
