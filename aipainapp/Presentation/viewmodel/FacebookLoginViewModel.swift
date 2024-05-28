import Foundation
import FBSDKLoginKit

class FacebookLoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var userName: String? = nil
    @Published var userID: String? = nil
    @Published var userEmail: String? = nil

    private let loginManager = LoginManager()

    func handleLogin() {
        loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { result, error in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }

            guard let result = result, !result.isCancelled else {
                print("User cancelled login.")
                return
            }

            if let token = AccessToken.current {
                self.handleLoginResult(token.tokenString)
            }
        }
    }

    func handleLoginResult(_ accessToken: String) {
        // Handle Facebook login result
        fetchUserProfile()
    }

    func fetchUserProfile() {
        GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"]).start { _, result, error in
            if let error = error {
                print("Failed to fetch user profile: \(error.localizedDescription)")
                return
            }

            if let result = result as? [String: Any],
               let id = result["id"] as? String,
               let name = result["name"] as? String,
               let email = result["email"] as? String {
                DispatchQueue.main.async {
                    self.userID = id
                    self.userName = name
                    self.userEmail = email
                    self.isLoggedIn = true
                    print("User ID: \(id)")
                    print("User Name: \(name)")
                    print("User Email: \(email)")
                }
            }
        }
    }

    func logout() {
        loginManager.logOut()
        DispatchQueue.main.async {
            self.isLoggedIn = false
            self.userID = nil
            self.userName = nil
            self.userEmail = nil
        }
    }
}
