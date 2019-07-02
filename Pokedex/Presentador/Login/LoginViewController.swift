//
//  ViewController.swift
//  Pokedex
//
//  Created by InternGuest on 6/20/19.
//  Copyright © 2019 InternGuest. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var window: UIWindow?
    @IBOutlet weak var accessButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func changeView(_ sender: Any) {
        
        if nameTextField.text?.isEmpty ?? true{
            print("Ingresa tu nickname, entrenador")
        }else{
            changeViewT()
            print("Bienvenido \(nameTextField.text!)")
            
        }
    }
    func changeViewT(){
        let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated : true)
    }
}

