//
//  help.swift
//  dt
//
//  Created by Анатолий Миронченко on 30.01.2023.
//

import Foundation

// function to print help message
func getHelp() {
    let helpMessage: String = "Use one of this commands: \n \t-h - get this help message\n\t-i - get information about all chets\n\t-i (chet name) - get information about one of chets\n\t-s - get sum for all chets\n\t-s (chet name) - get sum for one of chets\n\t-t - get all transactions for all chets\n\t-t (chet name) - get all transactions for one of chets\n\t-n (chet name) - create anew chet\n\t-d (chet name) - delete one of chet\n\t-a (sum) (chet name) - create transaction for one of chets"
    print(helpMessage)
}
