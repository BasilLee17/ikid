//
//  GoodViewController.swift
//  ikid
//
//  Created by Isabelle Donsbach on 5/1/22.
//

import UIKit

class KnockKnockViewController: UIViewController {
    
    var knock: UILabel!
    var who: UILabel!
    var answer: UILabel!
    var answerWho: UILabel!
    var jokeAnswer: UILabel!
    var flipButton: UIButton!
    
    var state = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //page setup
        view.backgroundColor = UIColor(red: 243/255, green: 176/255, blue: 195/255, alpha: 1)
        title = "Knock Knock"
        
        //knock knock state 1
        knock = UILabel()
        knock.text = "Knock Knock"
        knock.font = knock.font.withSize(20)
        knock.textAlignment = .center
        view.addSubview(knock)
        
        //who's there state 2
        who = UILabel()
        who.text = "Who's There?"
        who.font = who.font.withSize(20)
        who.textAlignment = .center
        view.addSubview(who)
        who.isHidden = true
        
        //interupting cow state 3
        answer = UILabel()
        answer.text = "Interupting Cow"
        answer.font = answer.font.withSize(20)
        answer.textAlignment = .center
        view.addSubview(answer)
        answer.isHidden = true
        
        //interupting cow who state 4
        answerWho = UILabel()
        answerWho.text = "Interupting Cow Who?"
        answerWho.font = answerWho.font.withSize(20)
        answerWho.textAlignment = .center
        view.addSubview(answerWho)
        answerWho.isHidden = true
        
        //MOOOO state 5
        jokeAnswer = UILabel()
        jokeAnswer.text = "MOOOOOO"
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
        knock.translatesAutoresizingMaskIntoConstraints = false
        who.translatesAutoresizingMaskIntoConstraints = false
        answer.translatesAutoresizingMaskIntoConstraints = false
        answerWho.translatesAutoresizingMaskIntoConstraints = false
        jokeAnswer.translatesAutoresizingMaskIntoConstraints = false
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(knock.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(knock.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(knock.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        
        constraints.append(who.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(who.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(who.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        
        constraints.append(answer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(answer.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(answer.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        
        constraints.append(answerWho.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(answerWho.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(answerWho.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        
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
        switch state {
        case 1:
            state = 2
            knock.isHidden = true
            UIView.transition(with: view, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
            who.isHidden = false
        case 2:
            state = 3
            who.isHidden = true
            UIView.transition(with: view, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
            answer.isHidden = false
        case 3:
            state = 4
            answer.isHidden = true
            UIView.transition(with: view, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
            answerWho.isHidden = false
            flipButtonClick()
        case 4:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                state = 5
                answerWho.isHidden = true
                UIView.transition(with: view, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
                jokeAnswer.isHidden = false
            }
        case 5:
            state = 1
            jokeAnswer.isHidden = true
            UIView.transition(with: view, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
            knock.isHidden = false
        default:
            print("An error has occured")
        }
    }


}
