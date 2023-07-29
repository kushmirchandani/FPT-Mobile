//
//  LoginView.swift
//  FPT
//
//  Created by Kush Mirchandani on 7/29/23.
//

import SwiftUI
@MainActor
struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    Spacer()
                    //Welcome Text
                    VStack {
                        Text("Fine Point Tutoring")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Learning Reimagined.")
                        Spacer()
                        //Login Form
                        VStack {
                            TextField("Enter Your Email", text: $viewModel.email)
                                .padding()
                                .autocapitalization(.none)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .foregroundColor(Color.white.opacity(0.4))
                                )
                                .cornerRadius(10)
                            
                            SecureField("Enter Your Password", text: $viewModel.password)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .foregroundColor(Color.white.opacity(0.4))
                                )
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color .red)
                        }
                        Button(action: {
                            viewModel.login()
                        }) {
                            Text("Sign in")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top, 20)
                    //                Spacer()
                    HStack{
                        Text("Don't have an account?")
                        NavigationLink("Sign Up", destination: ContentView())
                            .foregroundColor(Color.gray)
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
                //                }
                //                .navigationBarBackButtonHidden(true)
            }
            .padding()
            .background(Image("GradientdeuceGraident.Variation4"))
        }
        .navigationBarBackButtonHidden(true)
        }
        
    }
    
    //    final class LoginViewModel : ObservableObject{
    //
    //        @Published var email = ""
    //        @Published var password = ""
    //
    //        func signIn() {
    //            guard !email.isEmpty, !password.isEmpty else{
    //                print("No email or password found.")
    //                return
    //            }
    //            Task{
    //                do{
    //                    let returnedUserData: () = try await AuthenticationManager.shared.createUser(email: email, password: password)
    //                    print("Success")
    //                    print(returnedUserData)
    //                }catch{
    //                    print("Error: \(error)")
    //
    //                }
    //            }
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack{
                LoginView()
            }
            
        }
    }
