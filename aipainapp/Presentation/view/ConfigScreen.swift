import SwiftUI
import GoogleSignIn

struct ConfigScreen: View {
    
    
    var body: some View {
        ZStack {
            Text("ConfigScreen Screen")
            Spacer()
            NavComponent()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    struct ConfigScreen_Previews: PreviewProvider {
        static var previews: some View {
            ConfigScreen()
        }
    }
    
}

