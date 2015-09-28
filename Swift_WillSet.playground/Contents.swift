//: Playground - noun: a place where people can play
//: dengbinhero@163.com
//: 属性的willSet  &&  didSet


/*
*willSet:用于监听属性初始化前的事件
*didSet:用户监听属性初始化后的事件
*/

import UIKit

class Car {
    //宝马系列
    enum Series: String {
        case BMW3 = "宝马三系"
        case BMW5 = "宝马五系"
        case BMW7 = "宝马七系"
    }
    
    //属性：汽车系列对应的价格
    let priceDic:Dictionary<Series,Int> = [Series.BMW3:300000, Series.BMW5:500000, Series.BMW7:800000]
    //属性：汽车名字
    let name:String = "宝马"
    //属性：汽车价格
    var price = 300000
    //属性：汽车系列
    var series:Series = Series.BMW3 {
        //我们需要series在属性变化前做点什么
        willSet
        {
            print("hey！ guys，汽车系列要修改了，你需要做点什么吗？")
        }
        //我们需要在age属性发生变化后，做点什么：这里是要做的事是修改一下汽车的价格
        didSet
        {
            print("系列不一样，价格肯定就不一样啦！")
            price = priceDic[self.series]!
        }
    }
    
    //初始化
    init(series: Series) {
        self.series = series
    }
}

var car:Car = Car(series: Car.Series.BMW5)
car.series = Car.Series.BMW7
print("car Price : \(car.price)")



