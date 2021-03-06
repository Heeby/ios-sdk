//
//  LayerAnnotation.swift
//  Swift Examples
//
//  Copyright (c) 2014 Telerik. All rights reserved.
//

import Foundation

class LayerAnnotation:TKExamplesExampleViewController {
    
    let chart = TKChart()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chart.frame = self.view.bounds
        chart.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.FlexibleWidth.rawValue | UIViewAutoresizing.FlexibleHeight.rawValue)
        self.view.addSubview(chart)
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let values = [95, 40, 55, 30, 76, 34]
        var array = [TKChartDataPoint]()
        for i in 0..<months.count {
            array.append(TKChartDataPoint(x: months[i], y: values[i]))
        }
        let series = TKChartLineSeries(items: array)
        series.style.pointShape = TKPredefinedShape(type: TKShapeType.Circle, andSize: CGSizeMake(10, 10))
        chart.addSeries(series)

        let layer = CALayer()
        layer.bounds = CGRectMake(0, 0, 100, 100)
        layer.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.6).CGColor
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.yellowColor().CGColor
        layer.shadowOpacity = 1
        layer.cornerRadius = 10
        
        let a = TKChartLayerAnnotation(layer: layer, x:"Mar", y: 80, forSeries: series)
        a.zPosition = TKChartAnnotationZPosition.AboveSeries
        chart.addAnnotation(a)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

