//
//  StoryBoarded.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-07.
//
import UIKit

protocol StoryBoarded {
    static func instantiate() -> Self
}

extension StoryBoarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: className) as! Self
    }
}
