//
//  HomeView.swift
//  FoundationFinalProject
//
//  Created by Found on 24/11/26.
//

import SwiftUI

struct HomeView: View {
    
    let corLilas = Color(red: 0.78, green: 0.45, blue: 0.88)
    
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
                    
                    secaoFilmes(titulo: "Populares")
                    
                    secaoFilmes(titulo: "Recentes")

                    secaoFilmes(titulo: "Em alta")
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
            }
        }
    }
    
    // função simples para repetir cada carrossel
    func secaoFilmes(titulo: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(titulo)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(0..<4, id: \.self) { _ in
                        cardFilme()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func cardFilme() -> some View {
        ZStack(alignment: .bottomLeading) {
            //trocar esse retangulo pelo poster do filme na api ("nome_da_imagem"))
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 140, height: 220)
            
            //titulo e data da carta
            VStack(alignment: .leading, spacing: 2) {
                Text("2026")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.8))
                
                Text("Minha melhor amiga")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThinMaterial)
            .environment(\.colorScheme, .dark)
        }
        .frame(width: 140, height: 220)
        .cornerRadius(16)
    }
}

#Preview {
    HomeView()
}
