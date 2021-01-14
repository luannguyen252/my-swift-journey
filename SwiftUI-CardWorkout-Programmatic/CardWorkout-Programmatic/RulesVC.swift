

import UIKit

class RulesVC: UIViewController {
    
    let titleLabel = UILabel()
    let rulesLabel = UILabel()
    let excerciseLabel = UILabel()


    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
        
    }
    
    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight:.bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -30),
            
            
        ])
        
    }
    func configureRulesLabel(){
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = " The value of each card represents the numeber excercise you do.\n\nJ = 11, Q = 12 K =13  A = 14"
        rulesLabel.font = .systemFont(ofSize: 19,weight:. semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
        
        
        ])
        
    }
    func configureExerciseLabel(){
    view.addSubview(excerciseLabel)
    excerciseLabel.translatesAutoresizingMaskIntoConstraints = false
    excerciseLabel.text = "♠️ = Push-ups\n\n♥️ = Sit-up\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks"
    excerciseLabel.font = .systemFont(ofSize: 19,weight:. semibold)
    excerciseLabel.numberOfLines = 0
    
    NSLayoutConstraint.activate([
        excerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor,constant: 60),
        excerciseLabel.widthAnchor.constraint(equalToConstant: 200),
        excerciseLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor)
    
    ])
 }
}
