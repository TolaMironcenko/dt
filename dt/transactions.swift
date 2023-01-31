//
//  transactions.swift
//  dt
//
//  Created by Анатолий Миронченко on 29.01.2023.
//

import Foundation

// function for create a transaction
func createTransaction() {
    if (CommandLine.argc == 5) {
        if (CommandLine.arguments[3] != "main") {
            appendInFile(fileName: getDataDirectory() + "data/" + "main" + "/transactions", str: CommandLine.arguments[2] + "\t|\t" + getDateTimeNow() + "\t|\t" + CommandLine.arguments[4] + "\n")
            var newBalance: Float = (readFromFile(fileName: getDataDirectory() + "data/" + "main" + "/balance") as NSString).floatValue
            newBalance += (CommandLine.arguments[2] as NSString).floatValue
            writeInFile(fileName: getDataDirectory() + "data/" + "main" + "/balance", str: String(format: "%.2f", newBalance))
            print("main" + " balance: " + String(format: "%.2f", newBalance))
        }
        appendInFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/transactions", str: CommandLine.arguments[2] + "\t|\t" + getDateTimeNow()  + "\t|\t" + CommandLine.arguments[4] + "\n")
        var newBalance: Float = (readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/balance") as NSString).floatValue
        newBalance += (CommandLine.arguments[2] as NSString).floatValue
        writeInFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/balance", str: String(format: "%.2f", newBalance))
        print(CommandLine.arguments[3] + " balance: " + String(format: "%.2f", newBalance))
    } else {
        if (CommandLine.arguments[3] != "main") {
            appendInFile(fileName: getDataDirectory() + "data/" + "main" + "/transactions", str: CommandLine.arguments[2] + "\t|\t" + getDateTimeNow() + "\t|\tno category" + "\n")
            var newBalance: Float = (readFromFile(fileName: getDataDirectory() + "data/" + "main" + "/balance") as NSString).floatValue
            newBalance += (CommandLine.arguments[2] as NSString).floatValue
            writeInFile(fileName: getDataDirectory() + "data/" + "main" + "/balance", str: String(format: "%.2f", newBalance))
            print("main" + " balance: " + String(format: "%.2f", newBalance))
        }
        appendInFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/transactions", str: CommandLine.arguments[2] + "\t|\t" + getDateTimeNow() + "\t|\tno category" + "\n")
        var newBalance: Float = (readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/balance") as NSString).floatValue
        newBalance += (CommandLine.arguments[2] as NSString).floatValue
        writeInFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/balance", str: String(format: "%.2f", newBalance))
        print(CommandLine.arguments[3] + " balance: " + String(format: "%.2f", newBalance))
    }
}

// function for get transactions all chets or one chet
func getTransactions() {
    if (CommandLine.argc < 3) {
        let all_chets: [URL] = getAllChets()
        
        for chet: URL in all_chets {
            var chetarr: [String.SubSequence] = chet.absoluteString.split(separator: "/")
            chetarr.removeFirst()
            let transactions = readFromFile(fileName: "/" + chetarr.joined(separator: "/") + "/transactions").split(separator: "\n")

            print(chetarr[chetarr.count - 1] + " transactions: \n")

            if (transactions.count == 0) {
                print("\nNo transactions.\n")
            } else {
                for transaction in transactions {
                    print(" Transaction: " + transaction)
                }
                print("\n")
            }
        }
    } else {
        let transactions = readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[2] + "/transactions").split(separator: "\n")
        
        let balance: String = readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[2] + "/balance")

        if (balance != "") {
            print(CommandLine.arguments[2] + " transactions: \n")
            
            if (transactions.count == 0) {
                print("\nNo transactions.\n")
            } else {
                for transaction in transactions {
                    print("\tTransaction: " + transaction)
                }
            }
        } else {
            print("Can`t find this chet. Maybe you don`t have this chet.")
        }
    }
}
