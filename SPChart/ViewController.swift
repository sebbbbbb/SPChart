//
//  ViewController.swift
//  SPChart
//
//  Created by Sebastien on 24/11/2018.
//  Copyright © 2018 Sebastien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let chart = Chart(pies: [
            Pie(volume: 20, color: UIColor.red),
            Pie(volume: 30, color: UIColor.green),
            Pie(volume: 20, color: UIColor.blue),
            Pie(volume: 10, color: UIColor.orange),
            Pie(volume: 10, color: UIColor.white),
            Pie(volume: 10, color: UIColor.purple),
        ])
        
        let chartView = ChartView()
        chartView.frame = self.view.frame
        chartView.char = chart
        self.view.addSubview(chartView)
        
    }

    
    
    

}

class ChartView: UIView {
    
    var char: Chart!
    
    override func draw(_ rect: CGRect) {
        let center = self.center
        let radius: CGFloat = (rect.width / 2) - 20
        let angleComputer = accumulator(delfautAngle: CGFloat(270).toRadians())
        for pie in char.pies {
            let pieAngle = self.computeAngle(volume: CGFloat(Double(pie.volume) / 100.0))
            let endAngle = angleComputer(pieAngle)
            let startAngle = endAngle - pieAngle
            pie.color.setFill()
            UIColor.white.setStroke()
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.lineWidth = 2.0
            path.close()
            path.fill()
            path.stroke()
        }
    }
    
    func accumulator(delfautAngle: CGFloat) -> (CGFloat) -> (CGFloat) {
        var angle = delfautAngle
        return { nextAngle in
            angle += nextAngle
            return angle
        }
    }
    
    private func computeAngle(volume: CGFloat) -> CGFloat {
        return (2 * CGFloat.pi) * volume
    }
    
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat.pi / 180.0
    }
}
