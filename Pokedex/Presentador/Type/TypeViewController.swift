//
//  TypeViewController.swift
//  Pokedex
//
//  Created by InternGuest on 6/26/19.
//  Copyright © 2019 InternGuest. All rights reserved.
//

import UIKit

class TypeViewController: UIViewController{
    
    @IBOutlet weak var filterList: UITableView!
    
    weak var delegate : TypeViewControllerDelegate?
    
    var numberOfSections = 1
    var rowHeight: CGFloat = 82
    var filtros : [PokemonType]  = [.fire,.flying,.grass]
    let img: UIImage = UIImage(named: "ifFilter1608702")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterList.delegate = self
        filterList.dataSource = self
        filterList.rowHeight = rowHeight
        
        loadTypeStack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false //Ask this one.
        self.navigationController?.navigationBar.topItem?.title = "Types"
        
    }
    
    func loadTypeStack(){
        filterList.register(TableControllerViewCell.self, forCellReuseIdentifier: "FilterCell")
        let nib = UINib(nibName: String(describing: TableControllerViewCell.self), bundle: nil)
        filterList.register(nib, forCellReuseIdentifier: "FilterCell")
    }
    
    func loadInitFilter(cell: TableControllerViewCell){
        cell.filterNameLabel.text =  "ALL"
        cell.filterImageView.image = img
        cell.backgroundColor = .blue
    }
    
   
}

extension  TypeViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    //Specifies number of cells in table,execute by each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtros.count + 1
    }
    
    //Executes as many times as cells in the table.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = filterList.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! TableControllerViewCell
            loadInitFilter(cell: cell)
            return cell
        }
        
        if !filtros.isEmpty {
            let cell = filterList.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! TableControllerViewCell
            let pokeType =  filtros[indexPath.row - 1]
            cell.filterNameLabel.text =  pokeType.title
            cell.filterImageView.image = img
            cell.backgroundColor = pokeType.color
            return cell
        
        }
        //Si no hay filtros
        let cell = filterList.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! TableControllerViewCell
    
        cell.filterNameLabel.text =  "No hay filtros"
        cell.filterImageView.image = img
        cell.backgroundColor = .gray
        return cell //Poner que pasa cuando no hay elementos.La idea es crear otra celda. y ponerla :
        //Enso inspiration: class UserHasNoCardsTableViewCell: UITableViewCell
        
    }
}

extension TypeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       var cell =  filterList.cellForRow(at: indexPath) as! TableControllerViewCell
        if let filterName =  cell.filterNameLabel.text{
          self.delegate?.didUserSelectFilter(name: filterName)
            print("selected> \(cell.filterNameLabel.text!)")
            navigationController?.popViewController(animated: true)
        }

   }
}

