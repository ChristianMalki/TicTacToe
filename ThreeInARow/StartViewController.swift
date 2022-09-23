//
//  StartViewController.swift
//  ThreeInARow
//
//  Created by Christian Malki on 2022-09-21.
//

import UIKit

class StartViewController: UIViewController {

    let segueToGame = "segueToGame"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnStart(_ sender: Any) {
        performSegue(withIdentifier: segueToGame, sender: self)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
