//
//  PDFKitRepresentedView.swift
//  pdfTest
//
//  Created by hato on 2021/03/18.
//

import Foundation
import PDFKit

final class SamplePage: PDFPage {
    private let width = 1024
    private let height = 768
    private let title: String
    private let contents: String

    init(title: String, contents: String) {
        self.title = title
        self.contents = contents
        super.init()
    }

    override func draw(with box: PDFDisplayBox, to context: CGContext) {
        super.draw(with: box, to: context)
        UIGraphicsPushContext(context)
        context.translateBy(x: 0.0, y: CGFloat(height))
        context.scaleBy(x: 1.0, y: -1.0)
        let rect = CGRect(x: 25, y: 25, width: width, height: 100)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50),
                          NSAttributedString.Key.foregroundColor: UIColor.black]
        title.draw(in: rect, withAttributes: attributes)

        // 文字列描画
        let rect2 = CGRect(x: 25, y: 200, width: width, height: 600)
        contents.draw(in: rect2, withAttributes: attributes)

        // 線描画
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 100))
        path.addLine(to: CGPoint(x: width, y: 100))
        path.lineWidth = 5.0
        path.stroke()
        
        UIGraphicsPopContext()
    }

    override func bounds(for box: PDFDisplayBox) -> CGRect {
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
}

