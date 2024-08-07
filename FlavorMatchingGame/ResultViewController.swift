//
//  ResultViewController.swift
//  FlavorMatchingGame
//
//  Created by Shreya Agrawal on 5/5/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var ResultsLabel: UILabel!
    @IBOutlet weak var TryAgainButton: UIButton!
    var results = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultsLabel.text = results
        // Do any additional setup after loading the view.
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
