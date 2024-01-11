//
//  InitialViewModel.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-07.
//

import UIKit

class InitialViewModel: NSObject {
    
    override init() {
        
    }
    
    func checkAligability(completion: @escaping NetworkCompletionHandler) {
        completion("Pass", 200, true)
    }

}
