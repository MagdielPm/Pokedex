//
//  TypeViewController.swift
//  Pokedex
//
//  Created by InternGuest on 6/26/19.
//  Copyright © 2019 InternGuest. All rights reserved.
//

import UIKit

class TypeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func backHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
