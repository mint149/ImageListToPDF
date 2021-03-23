//
//  ImageListPage.swift
//  pdfTest
//
//  Created by hato on 2021/03/18.
//

import Foundation
import PDFKit

final class ImagePage: PDFPage {
    private let width: Int
    private let height: Int
    private let image: UIImage

    init(imageName: String) {
        self.image = UIImage(named:imageName)!
        width = Int(image.size.width)
        height = Int(image.size.height)
        super.init()
    }

    override init(image: UIImage) {
        self.image = image
        width = Int(image.size.width)
        height = Int(image.size.height)
        super.init()
    }

    override func draw(with box: PDFDisplayBox, to context: CGContext) {
        super.draw(with: box, to: context)
        UIGraphicsPushContext(context)
        
        // これがないと何故か画像が反転する
        context.translateBy(x: 0.0, y: CGFloat(height))
        context.scaleBy(x: 1.0, y: -1.0)
        
        image.draw(at: CGPoint(x:0, y:0))
        
        UIGraphicsPopContext()
    }

    override func bounds(for box: PDFDisplayBox) -> CGRect {
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
}
