//
//  LoginViewModel.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-07.
//

import UIKit

class LoginViewModel: NSObject {

    override init() {
        
    }
    
    func loginWithCredentials(completion: @escaping NetworkCompletionHandler) { 
        completion("Logged In", 200, true)
    }
}
