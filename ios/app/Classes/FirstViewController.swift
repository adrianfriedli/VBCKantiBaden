//
//  FirstViewController.swift
//  app
//
//  Created by Adrian Friedli on 27.12.14.
//  Copyright (c) 2014 Adrian Friedli. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let player = PlayerWrapper();
        label.text = player.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

