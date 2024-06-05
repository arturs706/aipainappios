import SwiftUI

struct PrimaryScreen: View {
    var body: some View {
        VStack {
            TopBarComponent()
            SearchBarComponent()

            Spacer()

            NavComponent()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct PrimaryScreen_Previews: PreviewProvider {
        static var previews: some View {
            PrimaryScreen()
        }
    }
}
