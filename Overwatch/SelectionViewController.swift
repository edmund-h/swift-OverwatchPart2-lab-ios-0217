//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Edmund Holderbaum on 2/25/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroScrollView: UIScrollView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    var game = Game()
    var nameLabels:[HeroName] = []
    
    var heroType: HeroType!{
        didSet{
            game.heroType = heroType
            nameLabels = HeroName.heroes(with: heroType)
        }
    }
    
    override func viewDidLoad() {
        heroScrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        heroType = .offense
        updateStackWithHeroes()
    }
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 3:
            heroType = .tank
        case 2:
            heroType = .support
        case 1:
            heroType = .defense
        default:
            heroType = .offense
        }
        cleanUpStackView()
        updateStackWithHeroes()
    }
    
    func updateStackWithHeroes(){
        //let heroName: HeroName = .dva
        let heroImageArray = HeroName.heroes(with: heroType).map{
            Hero(name: $0).produceHeroImage()
        }
        characterStackViewWidthConstraint.constant =
            CGFloat(heroImageArray.count) * heroImageArray[0].size.width
        for myImage in heroImageArray{
            characterStackView.addArrangedSubview(UIImageView(image: myImage))
        }
    }
    
    func cleanUpStackView(){
        for image in characterStackView.subviews{
            image.removeFromSuperview()
        }
    }
    
    func setUpLabel(){
        heroNameLabel.text = "Overwatch"
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPlace =  Int(scrollView.contentOffset.x / (5300/6))
        heroNameLabel.text = nameLabels[scrollPlace].rawValue
        print ("\(scrollView.contentOffset), \(scrollPlace)")
    }
}
