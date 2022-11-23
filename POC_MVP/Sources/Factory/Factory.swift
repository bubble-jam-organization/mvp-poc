//
//  Factory.swift
//  POC_MVP
//
//  Created by Thiago Henrique on 23/11/22.
//

import Foundation
import UIKit

enum Factory {
    case audioViewController
}

extension Factory {
    func make() -> UIViewController {
        switch self {
            case .audioViewController:
                let presenter = Presenter()
                let viewController = ViewController(presenter: presenter)
                presenter.viewDelegate = viewController
            
                return viewController
        }
    }
}
