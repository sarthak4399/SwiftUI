import SwiftUI

struct RegisterScreen: View {
    @State private var hidePassword = true
    @State private var hideCnfPassword = true
    @State private var spinner = false
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var password = ""
    @State private var cnfpassword = ""
    @State private var selectedRole = ""
    
    // Handle registration success
    func handleSuccess() {
        // Show success toast message
        showToast(message: "Registration Successful")
    }
    
    // Handle backend error
    func handleBackendError() {
        // Show error toast message
        showToast(message: "⚠️ Please Try again later!")
    }
    
    // Handle registration submit
    func handleSubmitRegister() {
        print(name, email, password, phone)
        
        if password == cnfpassword {
            spinner = true
            
            // Make API request
            // ...
            // Replace the API request code with your own implementation
            
            // Simulating API request completion with a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                spinner = false
                handleSuccess()
                
                // Reset form fields
                name = ""
                phone = ""
                email = ""
                password = ""
                cnfpassword = ""
                selectedRole = ""
            }
        } else {
            print("Password Not Matched")
        }
    }
    
    // Handle role selection
    func handleRoleSelection(role: String) {
        selectedRole = role
        print(role)
    }
    
    // Show toast message
    func showToast(message: String) {
        // Show toast message implementation
        // ...
        // Replace this with your own toast implementation
    }
    
    var body: some View {
        ScrollView {
            VStack {
                // Register Screen UI Code
                // ...
                // Replace this with your own UI code
                
                Text("Register Screen")
                    .font(.largeTitle)
                
                TextField("Full Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Phone", text: $phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Password Field
                HStack {
                    if hidePassword {
                        SecureField("Password", text: $password)
                    } else {
                        TextField("Password", text: $password)
                    }
                    
                    Button(action: {
                        hidePassword.toggle()
                    }) {
                        Image(systemName: hidePassword ? "eye.slash" : "eye")
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                // Confirm Password Field
                HStack {
                    if hideCnfPassword {
                        SecureField("Confirm Password", text: $cnfpassword)
                    } else {
                        TextField("Confirm Password", text: $cnfpassword)
                    }
                    
                    Button(action: {
                        hideCnfPassword.toggle()
                    }) {
                        Image(systemName: hideCnfPassword ? "eye.slash" : "eye")
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                Button(action: handleSubmitRegister) {
                    Text("Register")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
