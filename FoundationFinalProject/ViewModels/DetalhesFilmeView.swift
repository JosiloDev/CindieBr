
import SwiftUI
import Combine
@MainActor
class FilmesHomeViewModel: ObservableObject {

    @Published var populares: [MovieDTO] = []
    @Published var recentes: [MovieDTO] = []
    @Published var emAlta: [MovieDTO] = []

    @Published var carregando = false
    @Published var erro: String?

    private let service = MovieService()

    func carregarFilmes() async {

        carregando = true
        erro = nil

        defer {
            carregando = false
        }

        do {
            async let popular = service.fetchPopular()
            async let recente = service.fetchRecent()
            async let trending = service.fetchTrending()

            populares = try await popular
            recentes = try await recente
            emAlta = try await trending

        } catch {
            erro = error.localizedDescription
            print("Erro ao carregar filmes: \(error)")
        }
    }
}

