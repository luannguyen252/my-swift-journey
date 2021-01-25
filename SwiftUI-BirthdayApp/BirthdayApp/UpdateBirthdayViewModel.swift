//
//  UpdateBirthdayViewModel.swift
//  BirthdayApp
//
//  Created by jb on 2020/10/13.
//

import Foundation

class UpdateBirthdayViewModel {
    
    
    func updateBirthday(birthday: BirthdayViewModel){
        DataManager.shared.updateBirthday(id: birthday.id, name: birthday.name, date: birthday.date)
    }
}
