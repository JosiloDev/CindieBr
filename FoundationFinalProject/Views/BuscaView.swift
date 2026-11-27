//
//  BuscaView.swift
//  FoundationFinalProject
//
//  Created by Found on 27/11/26.
//

import SwiftUI

struct SearchView: View {
    @State private var textoBusca: String = ""

    let corLilas = Color(red: 0.78, green: 0.45, blue: 0.88)
    
    let gradienteRoxo = LinearGradient(
            colors: [
                Color(red: 0.65, green: 0.35, blue: 0.98),
                Color(red: 0.45, green: 0.15, blue: 0.85)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

    let sugestoes = [
        "Romance",
        "Drama",
        "Ação",
        "Terror",
        "Suspense",
        "Comédia"
    ]
    
    var body: some View {
        ZStack {

            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                
              
                Text("Buscar")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 12)
                
                Text("Sugestões")
                    .font(.title)
                    .bold()
                    .foregroundStyle(gradienteRoxo)
                    .padding(.top, 8)

                VStack(spacing: 0) {
                    ForEach(sugestoes.indices, id: \.self) { index in
                        Button {
                            textoBusca = sugestoes[index]
                        } label: {
                            HStack {
                                Text(sugestoes[index])
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.vertical, 14)
                            .padding(.horizontal, 16)
                        }
                        
                        if index < sugestoes.count - 1 {
                            Divider()
                                .background(Color.white.opacity(0.6))
                                .padding(.horizontal, 16)
                        }
                    }
                }
                .background(Color(white: 0.11))
                .cornerRadius(16)
                
                Spacer()
                
                HStack(spacing: 12) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("", text: $textoBusca, prompt: Text("Search").foregroundColor(.gray))
                            .foregroundColor(.white)
                            .tint(.blue)
                        
                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color(white: 0.12))
                    .clipShape(Capsule())
                    
                    Button {
                        textoBusca = ""
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color(white: 0.12))
                            .clipShape(Circle())
                    }
                }
                .padding(.bottom, 10)
            }
            .padding(.horizontal, 20)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    SearchView()
}
