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
            Pie(volume: 0.3, color: UIColor.red),
            Pie(volume: 0.3, color: UIColor.green),
            Pie(volume: 0.4, color: UIColor.blue),
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
        
        
        let firstPie = char.pies[0]
        
        UIColor.red.setFill()
       
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 250.0, y: 250.0))
        path.addArc(withCenter: CGPoint(x: 250, y: 250), radius: 50, startAngle: CGFloat(270).toRadians(), endAngle: self.computeAngle(volume: firstPie.volume) + CGFloat(270).toRadians(), clockwise: true)
        path.close()
        path.fill()
        
        let secondPie = char.pies[1]
        
        UIColor.green.setFill()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 250.0, y: 250.0))
     //   path2.addLine(to: CGPoint(x: 250.0, y: 300.0))
        path2.addArc(withCenter: CGPoint(x: 250, y: 250), radius: 50, startAngle: self.computeAngle(volume: firstPie.volume) + CGFloat(270).toRadians(), endAngle: self.computeAngle(volume: firstPie.volume) + self.computeAngle(volume: secondPie.volume) + CGFloat(270).toRadians(), clockwise: true)
        path2.close()
        path2.fill()
        
        
        let thirdPie = char.pies[2]
        
        UIColor.blue.setFill()
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: 250.0, y: 250.0))
        path3.addArc(withCenter: CGPoint(x: 250, y: 250), radius: 50, startAngle: self.computeAngle(volume: firstPie.volume) + self.computeAngle(volume: secondPie.volume) + CGFloat(270).toRadians(), endAngle: self.computeAngle(volume: firstPie.volume) + self.computeAngle(volume: secondPie.volume) + CGFloat(270).toRadians() + self.computeAngle(volume: thirdPie.volume) , clockwise: true)
        path3.close()
        path3.fill()
        
        
    }
    
    private func computeAngle(volume: CGFloat) -> CGFloat {
        return (2 * CGFloat.pi) * volume
    }
    
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(M_PI) / 180.0
    }
}
