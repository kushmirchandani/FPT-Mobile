//
//  LoginViewModel.swift
//  FPT
//
//  Created by Kush Mirchandani on 7/29/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    
    func login() {
//           guard validate() else {
               return
           }

           // try to log user
               // Handle successful login here (e.g., navigate to another screen)
           }
       

//       private func validate() -> Bool {
//           errorMessage = "Attempting Validation"
//           guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
//                 !password.trimmingCharacters(in: .whitespaces).isEmpty else {
//               errorMessage = "Not All Fields Filled"
//               return false
//           }
//
//           guard email.contains("@") && email.contains(".") else {
//               errorMessage = "Enter A Valid Email"
//               return false
//           }
//           return true
//       }
//   }

