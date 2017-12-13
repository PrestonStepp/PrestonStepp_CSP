//
//  AlgorithmsViewController.swift
//  PrestonStepp_CSP
//
//  Created by Stepp, Preston on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import WebKit

public class AlgorithmsViewController: UIViewController
{
    @IBOutlet weak var algorithmText: UILabel!
}
private func setupAlgorithm() -> Void
{
    var algorithmSteps : [String] = []
    
    let algorithm :String = "\n"
    let stepOne :String = "\n"
    let stepTwo :String = "\n"
    let stepThree :String = "\n"
    let stepFour :String = "\n"
    let stepFive :String = "\n"

    algorithmSteps = [stepOne, stepTwo, stepThree, stepFour, stepFive]
    
    let attributesDictonary = [NSAttributedStringKey.font : algorithmSteps.font]
    let fullAttributdString = NSMutableAttributedString(string: algorithm, attributes: attributesDictonary)
    
    for step in algorithmSteps
    {
        let bullet :String = "🏎"
        let formattedStep :String = "\n\(bullet) \(step)"
        let attributedStringStep = NSMutableAttributedString(string:formattedStep)
        let paragraphStyle = createParagraphStyle()
        
        attributedStringStep.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: NSMakeRange(0,attributedStringStep.length))
        
        fullAttributedString.append(attributedStringStep)
        {
            
            algorithmText.attributedText = fullAttributedString
        }
        
        private func createParagraphStyle() -> NSParagraphStyle
        {
            let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.defaultTabInterval = 15
            paragraphStyle.firstLineHeadIndent = 20
            paragraphStyle.headIndent = 35
            
            return paragraphStyle
        }
        
        override public func viewDidLoad()
        {
            super.viewDidLoad()
        }
    }
}


