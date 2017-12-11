//
//  BeersTableViewController.swift
//  31924
//
//  Created by user132969 on 12/1/17.
//  Copyright © 2017 user132969. All rights reserved.
//

import UIKit
import Kingfisher

class BeersTableViewController: UITableViewController {
    
    var dataSource: [Beer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! BeerViewController
        vc.beer = dataSource[tableView.indexPathForSelectedRow!.row]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBeers()
    }
    
    func loadBeers() {
        REST.loadBeers { (beers: [Beer]?) in
            if let beers = beers {
                self.dataSource = beers
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        
        let beer = dataSource[indexPath.row]
        cell.lbName.text = beer.name
        cell.lbAlcoholVolume.text = "Teor alcoólico: \(beer.alcoholVolume)"
        let url = URL(string: beer.image)
        cell.ivBeer.kf.setImage(with: url)
        
        return cell
    }
}
