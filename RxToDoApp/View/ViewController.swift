//
//  ViewController.swift
//  RxToDoApp
//
//  Created by mac on 2/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    
    @IBOutlet weak private var todoText: UITextField!
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var addButton: UIButton!
    
    private var viewModel = ViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddButton()
        setupTableView()
    }
    
    private func setupAddButton() {
        todoText.rx.text.orEmpty
            .map { text in
                return text == "" ? false : true
            }
            .bind(to: addButton.rx.isEnabled)
            .disposed(by: disposeBag)

        addButton.rx.tap
            .withLatestFrom(todoText.rx.text.orEmpty)
            .bind(to: viewModel.todoInput)
            .disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        viewModel.todoArray.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "TableViewCell")) {
                _, element, cell in
                cell.textLabel?.text = element
            }
            .disposed(by: disposeBag)
    }
}
