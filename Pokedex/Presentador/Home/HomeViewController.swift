//
//  HomeViewController.swift
//  Pokedex
//
//  Created by InternGuest on 6/20/19.
//  Copyright © 2019 InternGuest. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var cvPokemones: UICollectionView!
    
    let realPokemones = [Pokemon.init(number: 1, name: "Bulbasaur", type: [.grass, .poison], img: UIImage(named: "Pruebaxd")!),
                         Pokemon.init(number: 2, name: "Ivysaur", type: [.grass, .poison], img: UIImage(named: "Pruebaxd")!),
                         Pokemon.init(number: 3, name: "Venusaur", type: [.grass, .poison], img: UIImage(named: "Pruebaxd")!),
                         Pokemon.init(number: 4, name: "Charmander", type: [.fire], img: UIImage(named: "Pruebaxd")!),
                         Pokemon.init(number: 5, name: "Charmeleon", type: [.fire], img: UIImage(named: "Pruebaxd")!),
                         Pokemon.init(number: 6, name: "Charizard", type: [.fire, .flying], img: UIImage(named: "Pruebaxd")!),
                         Pokemon.init(number: 7, name: "Squirtle", type: [.water], img: UIImage(named: "Pruebaxd")!),
                         Pokemon.init(number: 8, name: "Wartortle", type: [.water], img: UIImage(named: "Pruebaxd")!),
                         Pokemon.init(number: 9, name: "Blastoise", type: [.water], img: UIImage(named: "Pruebaxd")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchImage = UIImage(named: "search")
        self.navigationController?.isNavigationBarHidden = true
        addImageTo(txtField: txtSearch, andImage: searchImage!)
        cvPokemones.delegate = self
        cvPokemones.dataSource = self
        registerCell()

    }
    
    func addImageTo(txtField: UITextField, andImage img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 100, y: 0, width:img.size.width,height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realPokemones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ListCollectionViewCell
        cell.number.text = "#\(realPokemones[indexPath.item].number)"
        cell.name.text = realPokemones[indexPath.item].name
        cell.ImageView.image = realPokemones[indexPath.item].img
        if realPokemones[indexPath.item].type.count == 1 {
            cell.DoubleLabel.isHidden = true
            cell.oneType.text = realPokemones[indexPath.item].type[0].title
            cell.oneType.backgroundColor = realPokemones[indexPath.item].type[0].color
        }else{
            cell.DoubleLabel.isHidden = false
            cell.firstType.text = realPokemones[indexPath.item].type[0].title
            cell.firstType.backgroundColor = realPokemones[indexPath.item].type[0].color
            cell.secondType.text = realPokemones[indexPath.item].type[1].title
            cell.secondType.backgroundColor = realPokemones[indexPath.item].type[1].color
        }
        
        return cell
    }
    
    func registerCell(){
        cvPokemones.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        let nib = UINib(nibName: String(describing: ListCollectionViewCell.self), bundle: nil)
        cvPokemones.register(nib, forCellWithReuseIdentifier: "Cell")
    }
    
    @IBAction func changeToTypeView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TypeView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TypeView") as! TypeViewController
        self.navigationController?.pushViewController(viewController, animated : true)
        
    }
    
}
