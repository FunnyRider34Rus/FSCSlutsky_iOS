//
//  ClubsViewController.swift
//  FSCSlutsky
//
//  Created by el_Pablo on 07.11.2023.
//

import UIKit

class ClubsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        title = "Команды"
        view.backgroundColor = DesignSystem.Colors.background
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
