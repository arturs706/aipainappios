import Foundation
import GoogleSignIn

class GoogleLoginViewModel: ObservableObject {
    func handleLogin() {
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
                guard let result = signInResult else {
                    // Handle error
                    print("Sign in error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                let id = result.user.userID
                let email = result.user.profile?.email
                print("ID: \(id)")
                print("EMAIL: \(email)")
            }
        } else {
            print("Root view controller not available.")
        }
    }
}
