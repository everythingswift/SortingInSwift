//
//  SortingDetailViewController.swift
//  Sorting
//
//  Created by SRIDHAR SANAPALA on 9/4/17.
//  Copyright © 2017 Everything Swift. All rights reserved.
//

import UIKit

class SortingDetailViewController: UIViewController {

    @IBOutlet weak var stepsTextView:UITextView!
    @IBOutlet weak var unsortedContentsLabel:UILabel!
    
    var titleString:String!
    let sortingTypes = ["Selection Sort", "Insertion Sort", "Bubble Sort", "Merge Sort", "Quick Sort"]
    let unsortedArray = [10, 22, 50, 9, 33, 41, 21, 40, 80, 60, 26]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = titleString
        self.unsortedContentsLabel.text = "[10, 22, 50, 9, 33, 41, 21, 40, 80, 60, 26]"
        
        switch titleString {
            case "Selection Sort":
                self.showSelectionSort()
            case "Insertion Sort":
                self.showInsertionSort()
            case "Bubble Sort":
                self.showBubbleSort()
            case "Merge Sort":
                self.showMergeSort()
            case "Quick Sort":
                self.showQuickSort()
            default:
                print("All others")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Selection Sort
    func showSelectionSort(){
        var result = unsortedArray
        for var i in 0..<result.count{
            var min_index = i
            for var j in i+1..<result.count{
                if result[j] < result[min_index]{
                    min_index = j
                }
            }
            
            if min_index != i{
                let temp = result[i]
                result[i] = result[min_index]
                result[min_index] = temp
            }
            
            let currentText = stepsTextView.text + "\n" + String(describing: result)
            stepsTextView.text = currentText
        }
    }
    
    //MARK: - Insertion Sort
    func showInsertionSort(){
        
        var result = unsortedArray
        for var i in 0..<unsortedArray.count{
            
            let key = result[i]
            var j = i-1
            while j >= 0 && result[j] > key {
                result[j+1] = result[j]
                j = j-1
            }
            
            result[j+1] = key
            print(result)
            let currentText = stepsTextView.text + "\n" + String(describing: result)
            stepsTextView.text = currentText
        }
    }
    
    //MARK: - Bubble Sort
    func showBubbleSort(){
        
        var result = unsortedArray
        var didSwap = false
        
        for var i in 0..<unsortedArray.count-1{
            for j in 0..<unsortedArray.count-i-1{
                
                if(result[j] > result[j+1]){
                    let temp = result[j]
                    result[j] = result[j+1]
                    result[j+1] = temp
                }

                let currentText = stepsTextView.text + "\n" + String(describing: result)
                stepsTextView.text = currentText
                print(result)
            }
        }
    }
    
    //MARK: - Merge Sort
    func showMergeSort(){
        let _ = performMergeSort(arrayToSort: unsortedArray)
    }
    
    
    func performMergeSort(arrayToSort: [Int]) -> [Int]{
        if arrayToSort.count == 1{
            return arrayToSort
        }
        
        let mid:Int = arrayToSort.count / 2
        var currentText = stepsTextView.text + "\n" + ("mid " + String(describing: mid))
        stepsTextView.text = currentText
        print("mid " + String(describing: mid))

        let left = performMergeSort(arrayToSort: Array(arrayToSort.prefix(upTo: mid)))
        print("left " + String(describing:left))
        currentText = stepsTextView.text + "\n" + ("left " + String(describing:left))
        stepsTextView.text = currentText

        let right = performMergeSort(arrayToSort: Array(arrayToSort.suffix(from: mid)))
        print("right " + String(describing:right))
        currentText = stepsTextView.text + "\n" + ("right " + String(describing:right))
        stepsTextView.text = currentText
        
        let merged = merge(leftArray: left, rightArray: right)
        print("merged " + String(describing:merged))
        currentText = stepsTextView.text + "\n" + ("merged " + String(describing:merged))
        stepsTextView.text = currentText
        return merged
    }
    
    func merge(leftArray: [Int], rightArray: [Int]) -> [Int]{
        var mergedArray:[Int] = []
        
        var i = 0
        var j = 0
        while i<leftArray.count || j < rightArray.count{
            if i<leftArray.count && j<rightArray.count{
                if leftArray[i] < rightArray[j]{
                    mergedArray.append(leftArray[i])
                    i += 1
                }else if leftArray[i] > rightArray[j]{
                    mergedArray.append(rightArray[j])
                    j += 1
                }
            }else if i<leftArray.count {
                mergedArray.append(leftArray[i])
                i += 1
            }else if j<rightArray.count{
                mergedArray.append(rightArray[j])
                j += 1
            }
        }
        
        if leftArray.count < rightArray.count{
            while j < rightArray.count{
                mergedArray.append(rightArray[j])
                j += 1
            }
        }
        
        if leftArray.count > rightArray.count{
            while i < leftArray.count{
                mergedArray.append(leftArray[i])
                i += 1
            }
        }    
        return mergedArray
    }
    
    //MARK: - Quick Sort
    func showQuickSort(){
        let _ = performQuickSort(arrayToSort: unsortedArray)
    }
    
    func performQuickSort(arrayToSort : [Int]) -> [Int]{
        if arrayToSort.count == 1{
            return arrayToSort
        }
        
        let pivotIndex:Int = arrayToSort.count - 1
        var leftArray:[Int] = []
        var rightArray:[Int] = []
        
        for var i in 0..<pivotIndex{
            if arrayToSort[i] < arrayToSort[pivotIndex]{
                leftArray.append(arrayToSort[i])
            }else if arrayToSort[i] > arrayToSort[pivotIndex]{
                rightArray.append(arrayToSort[i])
            }
        }
        
        print("leftArray: " + String(describing: leftArray))
        print("rightArray : " + String(describing: rightArray))
        var currentText = stepsTextView.text + "\n" + ("leftArray: " + String(describing: leftArray))
        stepsTextView.text = currentText
        currentText = stepsTextView.text + "\n" + ("rightArray : " + String(describing: rightArray))
        stepsTextView.text = currentText

        
        var leftSortedArray:[Int]
        
        if leftArray.count > 1{
            leftSortedArray = performQuickSort(arrayToSort: leftArray)
        }else{
            leftSortedArray = leftArray
        }
        
        var rightSortedArray:[Int]
        if rightArray.count > 1{
            rightSortedArray = performQuickSort(arrayToSort: rightArray)
        }else{
            rightSortedArray = rightArray
        }
        
        let resultArray = concatenateArrays(leftSortedArray: leftSortedArray, rightSortedArray: rightSortedArray, pivotElement: arrayToSort[pivotIndex])
        currentText = stepsTextView.text + "\n" + ("resultsArray : " + String(describing: resultArray))
        stepsTextView.text = currentText
        print(resultArray)
        return resultArray
        
    }
    
    func concatenateArrays(leftSortedArray: [Int],  rightSortedArray: [Int], pivotElement : Int) -> [Int]{
        
        var resultArray:[Int] = []
        for var n in leftSortedArray{
            resultArray.append(n)
        }
        
        resultArray.append(pivotElement)
        for var k in rightSortedArray{
            resultArray.append(k)
        }
        return resultArray
    }
    

}
