import SwiftUI
import Notion

import SwiftUI

struct ContentView: View {
    @State var abriuCard = false
    @State var catalogo = false
    @State var filmes = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {

                Text("Recentes")
                    .font(.title2)

                HStack {
                    Button("Filme 1") {
                        abrirCard()
                    }

                    Button("Filme 2") {
                        abrirCard()
                    }
                }

                Text("Recomendados")
                    .font(.title2)

                HStack {
                    Button("Filme 3") {
                        abrirCard()
                    }

                    Button("Filme 4") {
                        abrirCard()
                    }
                }

                Text("Descobertas")
                    .font(.title2)

                HStack {
                    Button("Filme 5") {
                        abrirCard()
                    }

                    Button("Filme 6") {
                        abrirCard()
                    }
                }

                Divider()

                Button("Catálogo") {
                    tel_catalogo()
                }

                Button("Filmes") {
                    filme()
                }
            }
            .padding()
            .navigationDestination(isPresented: $abriuCard) {
                Text("Informações do filme")
            }
            .navigationDestination(isPresented: $catalogo) {
                Text("Tela do catálogo")
            }
            .navigationDestination(isPresented: $filmes) {
                Text("Tela de filmes")
            }
        }
    }

    func abrirCard() {
        abriuCard = true
    }

    func tel_catalogo() {
        catalogo = true
    }

    func filme() {
        filmes = true
    }
}
#Preview {
    ContentView()
}
