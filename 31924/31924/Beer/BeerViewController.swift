//
//  BeerViewController.swift
//  31924
//
//  Created by user131751 on 12/10/17.
//  Copyright © 2017 user132969. All rights reserved.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTagline: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var lbTeorAlcoolico: UILabel!
    @IBOutlet weak var lbEscalaAmargor: UILabel!
    @IBOutlet weak var ivBeer: UIImageView!
    
    var beer: Beer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbName.text = beer.name
        lbTagline.text = beer.tagline
        tvDescription.text = beer.description
        lbTeorAlcoolico.text = "Teor alcoólico: \(beer.alcoholVolume)"
        lbEscalaAmargor.text = "Escala de Amargor: \(beer.bitternessScale)"
        let url = URL(string: beer.image)
        ivBeer.kf.setImage(with: url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
