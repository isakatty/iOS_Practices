//
//  ShoppingTableViewController.swift
//  SettingTableView
//
//  Created by Jisoo Ham on 5/27/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var addBtn: UIButton!
    
    var todoList = [Shopping]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 60
        configureUI()
    }
    
    @IBAction func tfEnterTapped(_ sender: UITextField) {
        print("enter tapped")
    }
    
    
    func configureUI() {
        todoTextField.placeholder = "무엇을 구매하실 건가요?"
        addBtn.setTitle("추가", for: .normal)
        addBtn.tintColor = .black
        addBtn.backgroundColor = .lightGray
        
        addBtn.addTarget(
            self,
            action: #selector(addTodo),
            for: .touchUpInside
        )
        
    }
    
    @objc func addTodo() {
        guard let text = todoTextField.text else { return }
        
        let todo = Shopping(todo: text)
        
        todoList.append(todo)
        tableView.reloadData()
    }

    override func tableView(
        _ tableView: UITableView, 
        numberOfRowsInSection section: Int
    ) -> Int {
        return todoList.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ShoppingTableViewCell",
            for: indexPath
        ) as? ShoppingTableViewCell
        else { return UITableViewCell() }
        
        let checkBtnImg = todoList[indexPath.row].isChecked
        ? "checkmark.square.fill"
        : "checkmark.square"
        
        
        let favBtnImg = todoList[indexPath.row].isLiked
        ? "star.fill"
        : "star"
        
        cell.configureBtn(
            btn: cell.checkBtn,
            btnImgName: checkBtnImg
        )
        
        cell.configureBtn(
            btn: cell.favBtn,
            btnImgName: favBtnImg
        )
        
        cell.configureLabel(
            label: cell.todoLabel,
            text: todoList[indexPath.row].todo,
            fontSize: 17,
            fontWeight: .regular
        )
        cell.checkBtn.tag = indexPath.row
        cell.favBtn.tag = indexPath.row
        
        cell.checkBtn.addTarget(
            self,
            action: #selector(checkBtnTapped),
            for: .touchUpInside
        )
        cell.favBtn.addTarget(
            self,
            action: #selector(favBtnTapped),
            for: .touchUpInside
        )
        
        return cell
        
    }
    
    @objc func checkBtnTapped(sender: UIButton) {
        todoList[sender.tag].isChecked = !todoList[sender.tag].isChecked
        
//        tableView.reloadData()
        tableView.reloadRows(
            at: [IndexPath(
                row: sender.tag,
                section: 0
            )],
            with: .automatic
        )
        
    }
    @objc func favBtnTapped(sender: UIButton) {
        todoList[sender.tag].isLiked = !todoList[sender.tag].isLiked
        
//        tableView.reloadData()
        tableView.reloadRows(
            at: [IndexPath(
                row: sender.tag,
                section: 0
            )],
            with: .automatic
        )
        
    }
    
    
    
}
