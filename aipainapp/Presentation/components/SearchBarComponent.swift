import SwiftUI

struct SearchBarComponent: View {
    @State private var searchText = ""
    @StateObject private var viewModel = SearchBarViewModel()
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Color.salmon
                        .cornerRadius(8)

                    TextField("Search countries", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(8)
                        .background(Color.salmon)
                }
                .padding()
            }
            .frame(height: 70)
            .background(Color.salmon)
            
            if viewModel.isSearching || !searchText.isEmpty {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.countriesList, id: \.self) { country in
                            Text(country)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .padding()
                                .onTapGesture {
                                    // Handle tap action
                                }
                        }
                    }
                    .background(Color.white.opacity(0.8))
                    .padding()
                }
                .background(Color.yellow.opacity(0.2)) // Background color for ScrollView
            }
        }
    }
}

struct SearchBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarComponent()
    }
}
