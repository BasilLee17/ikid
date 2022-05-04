//
//  GoodViewController.swift
//  ikid
//
//  Created by Isabelle Donsbach on 5/1/22.
//

import UIKit

class GoodViewController: UIViewController {
    
    var joke: UILabel!
    var jokeAnswer: UILabel!
    var flipButton: UIButton!
    
    var showingAnswer = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //page setup
        view.backgroundColor = UIColor(red: 171/255, green: 222/255, blue: 230/255, alpha: 1)
        title = "Good"
        
        //joke label
        joke = UILabel()
        joke.text = "Why was 6 afraid of 7"
        joke.font = joke.font.withSize(20)
        joke.textAlignment = .center
        view.addSubview(joke)
        
        //joke answer label
        jokeAnswer = UILabel()
        jokeAnswer.text = "Approximately -0.89441702 (cos 789)"
        jokeAnswer.font = jokeAnswer.font.withSize(20)
        jokeAnswer.textAlignment = .center
        view.addSubview(jokeAnswer)
        jokeAnswer.isHidden = true
        
        //button
        
        flipButton = UIButton()
        flipButton.setTitle("next", for: .normal)
        flipButton.setTitleColor(.white, for: .normal)
        flipButton.backgroundColor = .systemBlue
        flipButton.layer.cornerRadius = 15
        view.addSubview(flipButton)
        configure()
        flipButton.addTarget(self, action: #selector(flipButtonClick), for: .touchUpInside)

    }
    
    func configure() {
        joke.translatesAutoresizingMaskIntoConstraints = false
        jokeAnswer.translatesAutoresizingMaskIntoConstraints = false
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(joke.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(joke.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(joke.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        
        constraints.append(jokeAnswer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(jokeAnswer.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(jokeAnswer.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        
        constraints.append(flipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(flipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20))
        constraints.append(flipButton.widthAnchor.constraint(equalToConstant: 80))
        constraints.append(flipButton.heightAnchor.constraint(equalToConstant: 40))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func flipButtonClick() {
        if showingAnswer {
            showingAnswer = false
            UIView.transition(with: view, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
            
            joke.isHidden = false
            jokeAnswer.isHidden = true
            
        } else {
            showingAnswer = true
            
            UIView.transition(with: view, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
            
            joke.isHidden = true
            jokeAnswer.isHidden = false
        }
    }


}
