import SwiftUI
import GoogleSignIn

struct FavouritesScreen: View {
    
    
    var body: some View {
        ZStack {
            Text("FavouritesScreen Screen")
            Spacer()
            NavComponent()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    struct FavouritesScreen_Previews: PreviewProvider {
        static var previews: some View {
            FavouritesScreen()
        }
    }
    
}

