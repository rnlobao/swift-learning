//
//  ViewController.swift
//  DependenciesCocoaPods
//
//  Created by Robson Novato Lobao on 05/07/21.
//

import UIKit
import Nuke

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageXiewLuigi: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        loadImage2()
    }
    
    func loadImage() {
        if let url = URL(string: "https://supermariorun.com/assets/img/stage/mario03.png") {
                    Nuke.loadImage(with: ImageRequest(url: url), into: imageView)
                }
    }
    
    func loadImage2(){
        if let url = URL(string: "https://www.imagenspng.com.br/wp-content/uploads/2015/02/super-mario-luigi-01.png") {
                    Nuke.loadImage(with: ImageRequest(url: url), into: imageXiewLuigi)
                }
    }
    
}

