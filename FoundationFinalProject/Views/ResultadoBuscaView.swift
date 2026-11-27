
import SwiftUI

struct CategoryMoviesView: View {

    var categoriaTitulo: String = "Terror"

    @State private var textoBusca: String = ""

    let gradienteRoxo = LinearGradient(
        colors: [
            Color(red: 0.65, green: 0.35, blue: 0.98),
            Color(red: 0.45, green: 0.15, blue: 0.85)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    let colunas = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]

    var body: some View {

        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {

               
                Text(categoriaTitulo)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(gradienteRoxo)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)

     
                HStack(spacing: 12) {

                    HStack(spacing: 8) {

                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)

                        TextField(
                            "",
                            text: $textoBusca,
                            prompt: Text("Search")
                                .foregroundColor(.gray)
                        )
                        .foregroundColor(.white)
                        .tint(.blue)

                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 14)
                    .frame(height: 40)
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
                .padding(.horizontal, 20)

                ScrollView(showsIndicators: false) {

                    LazyVGrid(
                        columns: colunas,
                        spacing: 14
                    ) {

                        ForEach(0..<30, id: \.self) { _ in
                            cardFilmeGrade()
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 14)
                    .padding(.bottom, 20)
                }
                .frame(maxHeight: .infinity)
            }
        }
        .preferredColorScheme(.dark)
    }

    func cardFilmeGrade() -> some View {

        GeometryReader { geometry in

            ZStack(alignment: .bottomLeading) {

                Rectangle()
                    .fill(Color.gray.opacity(0.3))

                VStack(alignment: .leading, spacing: 2) {

                    Text("2026")
                        .font(.system(size: 9))
                        .foregroundColor(.white.opacity(0.8))

                    Text("A Odisseia")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                }
                .padding(8)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .background(.ultraThinMaterial)
                .environment(\.colorScheme, .dark)
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .aspectRatio(140.0 / 220.0, contentMode: .fit)
    }
}

#Preview {
    CategoryMoviesView()
}
