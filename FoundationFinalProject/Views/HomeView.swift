//
//  HomeView.swift
//  FoundationFinalProject
//
//  Created by Found on 24/11/26.
//

import SwiftUI

struct HomeView: View {
    
    let corLilas = Color(red: 0.78, green: 0.45, blue: 0.88)
    @StateObject private var filmesVM = FilmesHomeViewModel()
    let gradienteRoxo = LinearGradient(
            colors: [
                Color(red: 0.65, green: 0.35, blue: 0.98),
                Color(red: 0.45, green: 0.15, blue: 0.85)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    
    var body: some View {
        ZStack {
            //fundo
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    //logo
                    HStack(spacing: 4) {
                        Image(systemName: "") //trocar pelo logo depois
                            .font(.title2)
                            .foregroundStyle(gradienteRoxo)
                            .offset(y: -8)
                        
                        Text("Lumia")
                            .font(.title)
                            .bold()
                            .foregroundStyle(gradienteRoxo)
                    }
                    .padding(.horizontal)
                    
                    secaoFilmes(
                        titulo: "Populares",
                        filmes: filmesVM.populares
                    )

                    secaoFilmes(
                        titulo: "Recentes",
                        filmes: filmesVM.recentes
                    )

                    secaoFilmes(
                        titulo: "Em alta",
                        filmes: filmesVM.emAlta
                    )
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
            }
        }
        .task {
            await filmesVM.carregarFilmes()
        }
    }
    
    // função simples para repetir cada carrossel
 
    func secaoFilmes(
        titulo: String,
        filmes: [MovieDTO]
    ) -> some View {

        VStack(alignment: .leading, spacing: 12) {

            Text(titulo)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 14) {

                    ForEach(filmes) { filme in
                        cardFilme(filme: filme)
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    

    func cardFilme(filme: MovieDTO) -> some View {

        ZStack(alignment: .bottomLeading) {

            AsyncImage(
                url: URL(
                    string: "https://image.tmdb.org/t/p/w500\(filme.posterPath ?? "")"
                )
            ) { image in

                image
                    .resizable()
                    .scaledToFill()

            } placeholder: {

                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay {
                        ProgressView()
                            .tint(.white)
                    }
            }
            .frame(width: 140, height: 220)
            .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.8)],
                startPoint: .center,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 2) {

                Text(String(filme.releaseDate?.prefix(4) ?? ""))
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.8))

                Text(filme.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .lineLimit(2)
            }
            .padding(10)
        }
        .frame(width: 140, height: 220)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    HomeView()
}
