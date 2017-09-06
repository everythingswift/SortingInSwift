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
    let sortingTypes = [SELECTION_SORT, INSERTION_SORT, BUBBLE_SORT, MERGE_SORT, QUICK_SORT, HEAP_SORT]
    var unsortedArray = [10, 22, 50, 9, 33, 41, 21, 40, 80, 60, 26]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = titleString
        self.unsortedContentsLabel.text = "[10, 22, 50, 9, 33, 41, 21, 40, 80, 60, 26]"
        
        switch titleString {
            case SELECTION_SORT:
                self.showSelectionSort()
            case INSERTION_SORT:
                self.showInsertionSort()
            case BUBBLE_SORT:
                self.showBubbleSort()
            case MERGE_SORT:
                self.showMergeSort()
            case QUICK_SORT:
                self.showQuickSort()
            case HEAP_SORT:
                self.showHeapSort()
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
        for i in 0..<result.count{
            var min_index = i
            for j in i+1..<result.count{
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
        for i in 0..<unsortedArray.count{
            
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
        
        for i in 0..<unsortedArray.count-1{
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
        
        for i in 0..<pivotIndex{
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
        for n in leftSortedArray{
            resultArray.append(n)
        }
        
        resultArray.append(pivotElement)
        for k in rightSortedArray{
            resultArray.append(k)
        }
        return resultArray
    }
    
    //MARK: - HEAP SORT
    
    func showHeapSort(){
        
        updateResultsTextView("Unsorted Array: " + String(describing: unsortedArray))
        updateResultsTextView("\n")
        
        var i = Int(unsortedArray.count - 1) / 2
        while i >= 0{
            heapify(&unsortedArray, n: unsortedArray.count, i: i)
            updateResultsTextView("Create Heap: \(i)" + String(describing: unsortedArray) + "\n")
            i -= 1
        }
        updateResultsTextView("\n")
        
        i = unsortedArray.count - 1
        var sortedArray:[Int] = []
        
        while i >= 0{
            sortedArray.insert(unsortedArray[0], at: 0)
            let temp = unsortedArray[unsortedArray.count - 1]
            unsortedArray[0] = temp
            unsortedArray.removeLast()
            heapify(&unsortedArray, n: unsortedArray.count, i: 0)
            updateResultsTextView("Sorting -> Heap: \(unsortedArray.count)" + String(describing: unsortedArray))
            i -= 1
        }
        updateResultsTextView("\n")

        updateResultsTextView("Sorted Array: " + String(describing: sortedArray))
    }

    func heapify(_ arrayToSort: inout [Int], n: Int, i: Int){
        
        var largest = i
        let left = 2*i + 1
        let right = 2 * i + 2
        
        if left < n && arrayToSort[largest] < arrayToSort[left]{
            largest = left
        }
        
        if right < n && arrayToSort[largest] < arrayToSort[right]{
            largest = right
        }
        
        if largest != i{
            let temp = arrayToSort[i]
            arrayToSort[i] = arrayToSort[largest]
            arrayToSort[largest] = temp
            
            heapify(&arrayToSort, n: n, i: largest)
        }
    }
    
    // UPDATE RESULTS TEXT VIEW
    
    func updateResultsTextView(_ contentString : String){
        let currentText = stepsTextView.text
        stepsTextView.text = currentText! + contentString + "\n"
    }
}
