//
//  String+QSUAdditions.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation

public extension String {
  
  func trim() -> String {
    return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
  
  func contains(string: String) -> Bool {
    guard !self.isEmpty else {
      return false
    }
    var s = self.characters.map{ $0 }
    let c = string.characters.map{ $0 }
    repeat {
      if s.starts(with: c){
        return true
      } else {
        s.removeFirst()
      }
    } while s.count > c.count - 1
    return false
  }
}
