import SwiftUI
import GoogleSignIn

struct AccountScreen: View {
    
    
    var body: some View {
        ZStack {
            Text("AccountScreen Screen")
            Spacer()
            NavComponent()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct AccountScreen_Previews: PreviewProvider {
        static var previews: some View {
            AccountScreen()
        }
    }
    
}

