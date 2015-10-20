//
//  LinkedList.swift
//  DataUtils
//
//  Created by Michael Westendorf on 10/19/15.
//  Copyright © 2015 Westendorf. All rights reserved.
//

import Foundation

enum LinkedListError : ErrorType {
	case IndexOutOfBounds
	case EmptyList
}

private class Node <T> {
	
	var data : T
	var prevNode : Node?
	var nextNode : Node?
	
	init(data: T, prevNode: Node<T>? = nil, nextNode: Node<T>? = nil) {
		self.data = data
		self.prevNode = prevNode
		self.nextNode = nextNode
	}
}


class LinkedList<T> {
	
	private var head : Node<T>?
	private var tail : Node<T>?
	private var count : UInt = 0
	
	init() {
		head = nil
		tail = nil
	}
	
	func add(data: T) {
		
		count++
		
		guard let _ = head else {
			head = Node(data: data)
			tail = head
			
			return
		}
		
		let tmpNode = Node(data: data, prevNode: tail)
		tail = tmpNode
	}
	
	func insert(data: T, index: UInt) throws {
		if(index > count) {
			throw LinkedListError.IndexOutOfBounds
		}
		
		count++
		if(head == nil && index == 0) {
			head = Node(data: data)
			tail = head
			
			return
		}
		
		if(index < (count / 2)) {
			insertFromHead(data, index: index)
		}
		else {
			insertFromTail(data, index: index)
		}
	}
	
	
	//MARK: private methods
	private func insertFromHead(data: T, index: UInt) {
		if var tmpNode = head {
			for _ in 0...index {
				tmpNode = tmpNode.nextNode!
			}
			
			let newNode = Node(data: data, prevNode: tmpNode.prevNode, nextNode: tmpNode)
			tmpNode.prevNode = newNode
		}
	}
	
	private func insertFromTail(data: T, index: UInt) {
		
	}
	
}
