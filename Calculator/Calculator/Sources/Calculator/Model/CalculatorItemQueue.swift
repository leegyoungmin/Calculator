//
//  CalculatorItemQueue.swift
//  Created by 미니.
//

protocol CalculateItem { }

struct CalculatorItemQueue<Element: CalculateItem> {
    private var inputStack: [Element] = []
    private var outputStack: [Element] = []
    
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    var front: Element? {
        return outputStack.last ?? inputStack.first
    }
    
    var count: Int {
        return outputStack.count + inputStack.count
    }
    
    init(elements: [Element] = []) {
        self.inputStack = elements
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.popLast()
    }
}