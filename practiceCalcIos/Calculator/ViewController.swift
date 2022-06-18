//
//  ViewController.swift
//  Calculator
//
//  Created by Keita Miyake on 2022/05/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CalculationProcessView: UILabel!
    @IBOutlet weak var CalculationResultView: UILabel!
    
    // 計算過程(表示のみ)
    var calcProcess = ""
    // 計算結果
    var calcResult = 0
    // 次に計算される前の数値
    var nextNumber = ""
    
    var calcNumbers:[Int] = []
    var opeSymbols:[String] = []
    
    // 0-9のボタンが押された時
    @IBAction func numberButton(_ sender: Any) {
        // それぞれのボタンに割り当てたタグを取得
        let tagNumber = (sender as! UIButton).tag
        // 文字列型に変更し追加する(2桁以上の数字を扱う場合 :"1"+"2"="12")
        nextNumber += String(tagNumber)
        
        calcProcess+=String(tagNumber)
        CalculationProcessView.text = calcProcess
    }
    
    // 「+」「-」を押した時
    @IBAction func operationSymbolButton(_ sender: Any) {
        // それぞれのボタンに割り当てたタグを取得
        let tagNumber = (sender as! UIButton).tag
        // 2桁以上の数字でも「＋ー」押した時点で桁数は確定する
        calcNumbers.append(Int(nextNumber)!)
        
        switch tagNumber{
            case 101: // +
                opeSymbols.append("+")
                calcProcess+="+"
                
            case 102: // -
                opeSymbols.append("-")
                calcProcess+="-"
                
            default:
                break
        }
        nextNumber=""
        CalculationProcessView.text = calcProcess
    }
    
    // 「AC」「＝」押した時
    @IBAction func operationButton(_ sender: Any) {
        // それぞれのボタンに割り当てたタグを取得
        let tagNumber = (sender as! UIButton).tag
        // 2桁以上の数字でも「＋ー」押した時点で桁数は確定する
        calcNumbers.append(Int(nextNumber)!)
        
        switch tagNumber{
            case 110: // AC
                // こうまとめた時にわかりやすい名前を付けることが大事
                calcProcess = ""
                calcResult = 0
                nextNumber = ""
                calcNumbers.removeAll()
                opeSymbols.removeAll()
                
            case 111: // =
                calcResult = calcNumbers[0]
                for i in 0..<opeSymbols.count{
                    if opeSymbols[i]=="+"{
                        calcResult+=calcNumbers[i+1]
                    }else if opeSymbols[i]=="-"{
                        calcResult-=calcNumbers[i+1]
                    }else{
                        // error
                    }
                }
                
            default:
                break
        }
        CalculationProcessView.text = calcProcess
        CalculationResultView.text = String(calcResult)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

