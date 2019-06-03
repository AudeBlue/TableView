//
//  ViewController.swift
//  030619TableViewEtCustomCell
//
//  Created by CHEVALIER on 03/06/2019.
//  Copyright © 2019 CHEVALIER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
    @IBOutlet weak var ui_tabeView: UITableView!
    
    
    var _nameList:[String] = []
    var _friendList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ui_tabeView.dataSource = self
        
        _nameList.append("Calipo")
        _nameList.append("will")
        
        _friendList.append("Ccoucou")
        _friendList.append("GI")
       
    }
    
    
    //Optionnel: combien de sections a afficher
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // COMBIEN DE LIGNES A AFFICHER
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount: Int
        
        
        if section == 0 {
            
            rowCount = _nameList.count
            
        } else {
            rowCount = _friendList.count
            
            
        }
        
        return rowCount
    }
    
    
    // AFFICHE LE TITRE DUNE SECTION
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title:String
        if section == 0 {
            
            title = " NAME LIST"
            
        } else {
            
            title = " FRIENDS LIST"
            
        }
        return title
    }
    
    //CREATION DE CELLULE / REPASSE DANS CETTE FONCTION POUR CREER CELLULE
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        //PRECHARGER UNE CELLULE CREER DANS LE STORYBOARD
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "number-cell", for: indexPath)
        
        if let titleLabel = cell.textLabel {
            
            
            if indexPath.section == 0{
                
                titleLabel.text = _nameList[indexPath.row]
                
            } else {
            
            titleLabel.text = _friendList[indexPath.row]
            }
        }
    
        
        return cell
    }
    
    
    
    //Cett fo,ction seule Fait apparaite le bouton rouge
    //COMPATIBLE AVEC SUPPRESSION, surveille les swipe delete, dès que swipe delete cette func envoi l'indexpath qui a été supprimer et c'est a nous de lui dire quoi faire
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //j'indique quoi faire si luser valide la suppresion, je supprime dans mon tableau
        //on supprime les données
        if indexPath.section == 0 {
            
            //enlever la donnée de la table
            _nameList.remove(at: indexPath.row)
            
        } else {
        
            _friendList.remove(at: indexPath.row)
            

        }
        
      //prevenir le tableView qu'il y a eu un changement
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }

}

