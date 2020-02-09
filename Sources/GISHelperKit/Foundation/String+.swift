//
//  String+URLS.swift
//  GISHelperKit
//
//  Created by 游宗諭 on 2019/8/26.
//  Copyright © 2019 ytyubox. All rights reserved.
//

import Foundation

extension String {
    public var urls: [String] {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count))
        var result = [String]()
        for match in matches {
            guard let range = Range(match.range, in: self) else { continue }
            let url = self[range]
            result.append(url.description)
        }
        return result
    }
	public var emptyNil: Self? {self.isEmpty ? nil : self }
	
	public func tabDescription(max:Int) -> String {
		let MaxtabCount = (max / 4) + 1
		let myTabCount = MaxtabCount - (count / 4)
		let array = [self] + (0..<myTabCount).map{_ in "\t"}
		return array.joined()
	}
}
