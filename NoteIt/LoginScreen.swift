import SwiftUI
import os

struct LoginScreen: View {
    @State private var spinner = false
    @State private var hidePassword = true
    @State private var password = ""
    @State private var email = ""
    @State private var isLoading = false
    @State private var showHome = false
    
    var body: some View {
        NavigationView {
            if spinner {
                Loader()
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Button(action: { }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                            }
                            Text("Login")
                                .foregroundColor(.white)
                                .font(.title)
                            Spacer()
                        }
                        .padding(.top, 20)
                        
                        VStack(spacing: 10) {
                            Text("Login with Email")
                                .font(.title)
                                .foregroundColor(Color.accentColor)
                            Text("Please Sign In to Continue")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(spacing: 10) {
                            Text("Email")
                                .foregroundColor(.black)
                                .font(.callout)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Enter email", text: $email)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        
                        VStack(spacing: 10) {
                            Text("Password")
                                .foregroundColor(.black)
                                .font(.callout)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack {
                                SecureField("Enter Password", text: $password)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(5)
                                    .autocapitalization(.none)
                                
                                Button(action: {
                                    hidePassword.toggle()
                                }) {
                                    Image(systemName: hidePassword ? "eye.slash" : "eye")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                        HStack {
                            Spacer()
                            Button(action: { }) {
                                Text("Forgot Password?")
                                    .foregroundColor(.red)
                                    .font(.system(size: 13))
                            }
                        }
                        .padding(.top, 10)
                        
                        Button(action: {
                            handlePress()
                            showHome = true
                        }) {
                            if isLoading {
                                HStack {
                                    ProgressView()
                                    Text("Logging In...")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }
                            } else {
                                Text("Log In")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(isLoading ? Color.green : Color.blue)
                                    .cornerRadius(5)
                            }
                        }
                        .disabled(isLoading)
                        
                        HStack {
                            Text("Don't have an Account?")
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                            Button(action: { }) {
                                Text("Create New")
                                    .foregroundColor(.blue)
                                    .underline()
                                    .font(.system(size: 13))
                            }
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Spacer()
                            Text("or log in with")
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        
                        HStack {
                            Button(action: { }) {
                                Image(systemName: "applelogo")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.blue)
                            }
                            Button(action: { }) {
                                Image(systemName: "facebook")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        Text("By using TaskStack you agree to our Terms of Services and Privacy Policy")
                            .foregroundColor(.black)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                .background(
                    NavigationLink(
                        destination: Home(),
                        isActive: $showHome,
                        label: { EmptyView() }
                    )
                )
            }
        }
        .navigationBarHidden(true)
    }
    
    private func handlePress() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            os_log("Logging in")
        }
    }
}

struct Loader: View {
    var body: some View {
        Text("Loading...")
    }
}



struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
