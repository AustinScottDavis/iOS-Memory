//
//  MemoryThemeChooserViewController.swift
//  Memory
//
//  Created by Austin Davis on 6/13/19.
//  Copyright © 2019 Austin Davis. All rights reserved.
//

import UIKit

class MemoryThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

    // MARK: - Navigation
    
    let themes = [
        "Sports":"⚽️🏀🏈⚾️🥎🎾🏐",
        "Animals":"🦕🐬🐍🐢🐞🐌🦟",
        "Faces":"😎😁🤪🙁😩🤬🥶",
    ]
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let mvc = secondaryViewController as? MemoryViewController {
            if mvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let mvc = segue.destination as? MemoryViewController {
                    mvc.theme = theme
                }
            }
        }
    }
    

}
