//
//  ViewController.swift
//  SwiftUIAutolayoutSample
//
//  Created by usayuki on 2020/10/17.
//

import Combine
import UIKit
import SwiftUI

class ViewController: UIViewController {
    var cancellables: Set<AnyCancellable> = .init()

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var topConstraint1: NSLayoutConstraint!
    @IBOutlet private weak var topConstraint2: NSLayoutConstraint!

    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let hostingViewController1 = UIHostingController(rootView: ExpandLabelView1(viewModel: viewModel))
        addChild(hostingViewController1)
        view.addSubview(hostingViewController1.view)
        hostingViewController1.didMove(toParent: self)

        let hostingViewController2 = UIHostingController(rootView: ExpandLabelView2(viewModel: viewModel))
        addChild(hostingViewController2)
        view.addSubview(hostingViewController2.view)
        hostingViewController2.didMove(toParent: self)

        hostingViewController1.view.translatesAutoresizingMaskIntoConstraints = false
        hostingViewController2.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingViewController1.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            hostingViewController1.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingViewController1.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            hostingViewController2.view.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            hostingViewController2.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingViewController2.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        viewModel.subject1.sink { [weak self] height in
            self?.topConstraint1.constant = height + 32
        }
        .store(in: &cancellables)

        viewModel.subject2.sink { [weak self] height in
            self?.topConstraint2.constant = height + 32
        }
        .store(in: &cancellables)
    }


}

