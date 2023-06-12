import SwiftUI

struct Welcome: View {
    @State private var user: String?
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("TaskStack")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.accentColor)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Manage\nyour tasks easily")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                Text("Effortlessly manage your tasks with TaskStack.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Spacer()
                
                Button(action: {
                    handleSignIn()
                    
                }) {
                    HStack {
                        Text("Sign in with Google")
                        Image("google")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accentColor, lineWidth: 1)
                    )
                }
                
                Button(action: {
                    // Handle sign in with Facebook
                }) {
                    HStack {
                        Text("Sign in with Facebook")
                        Image("facebook")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accentColor, lineWidth: 1)
                    )
                }
                
                Button(action: {
                    showLoginScreen = true
                }) {
                    HStack {
                        Text("Sign in with Email")
                        Image(systemName: "envelope")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accentColor, lineWidth: 1)
                    )
                }
                .background(
                    NavigationLink(
                        destination: LoginScreen(),
                        isActive: $showLoginScreen,
                        label: { EmptyView() }
                    )
                )
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
    
    private func handleSignIn() {
        // Handle sign in with Google
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
