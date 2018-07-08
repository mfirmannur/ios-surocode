//
//  HomeViewController.swift
//  iqro
//
//  Created by MyMacbook on 7/8/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func goToUdpatePage(_ sender: Any) {
        let updateStoryBoard = UIStoryboard(name: "Updates", bundle: nil)
        let updatesViewController = updateStoryBoard.instantiateViewController(withIdentifier: "UpdatesViewController")
        navigationController?.pushViewController(updatesViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
