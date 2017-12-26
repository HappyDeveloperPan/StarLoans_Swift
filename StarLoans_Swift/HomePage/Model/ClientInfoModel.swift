//
//  ClientInfoModel.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/23.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

//client_id    int(11)    客户ID
//client_name    varchar(50)    客户姓名
//client_type    tinyint(3)    客户分类，1精准客户，2优质客户
//client_mortgage_asset    tinyint(3)    抵押资产，1房屋抵押，2车辆抵押
//client_loan_need    decimal(10,2)    贷款需求
//client_house_type    tinyint(3)    房产类型,1无房2有贷款房3有红本房4有小产权房
//client_car_type    tinyint(3)    车产类型,1无车2有全款车3有贷款车
//client_month_income        decimal(10,2)    月收入
//client_income_payment_type    tinyint(3)    发放形式,1代发工资
//client_is_shenzhen_census    tinyint(3)    是否深户，1是0否
//client_is_accumulated_funds    tinyint(3)    是否有公积金，1是0否
//client_is_social_security    tinyint(3)    是否有社保，1是0否
//client_price    decimal(10,2)    客户信息售价
//client_days_need    int(11)    需求程度（天数）

class ClientInfoModel: NSObject {
    struct Keys {
        static let client_id = "client_id"
        static let client_name = "client_name"
        static let client_type = "client_type"
        static let client_mortgage_asset = "client_mortgage_asset"
        static let client_loan_need = "client_loan_need"
        static let client_house_type = "client_house_type"
        static let client_car_type = "client_car_type"
        static let client_month_income = "client_month_income"
        static let client_income_payment_type = "client_income_payment_type"
        static let client_is_shenzhen_census = "client_is_shenzhen_census"
        static let client_is_accumulated_funds = "client_is_accumulated_funds"
        static let client_is_social_security = "client_is_social_security"
        static let client_price = "client_price"
        static let client_days_need = "client_days_need"
    }
    
    public var client_id: Int = 0
    public var client_name: String = ""
    public var client_type: Int = 0
    public var client_mortgage_asset: Int = 0
    public var client_loan_need: Float = 0
    public var client_house_type: Int = 0
    public var client_car_type: Int = 0
    public var client_month_income: Int = 0
    public var client_income_payment_type: Int = 0
    public var client_is_shenzhen_census: Bool = false
    public var client_is_accumulated_funds: Bool = false
    public var client_is_social_security: Bool = false
    public var client_price: Int = 0
    public var client_days_need: Int = 0
    
    public init(with json:JSON) {
        let appInfo = json
        self.client_id = appInfo[Keys.client_id].intValue
        self.client_name = appInfo[Keys.client_name].stringValue
        self.client_type = appInfo[Keys.client_type].intValue
        self.client_mortgage_asset = appInfo[Keys.client_mortgage_asset].intValue
        self.client_loan_need = appInfo[Keys.client_loan_need].floatValue
        self.client_house_type = appInfo[Keys.client_house_type].intValue
        self.client_car_type = appInfo[Keys.client_car_type].intValue
        self.client_month_income = appInfo[Keys.client_month_income].intValue
        self.client_income_payment_type = appInfo[Keys.client_income_payment_type].intValue
        self.client_is_shenzhen_census = appInfo[Keys.client_is_shenzhen_census].boolValue
        self.client_is_accumulated_funds = appInfo[Keys.client_is_accumulated_funds].boolValue
        self.client_is_social_security = appInfo[Keys.client_is_social_security].boolValue
        self.client_price = appInfo[Keys.client_price].intValue
        self.client_days_need = appInfo[Keys.client_days_need].intValue
    }
    
    override init() {
        super .init()
    }
}

extension ClientInfoModel {
    func getTypeImage() -> UIImage{
        switch client_type {
        case 1:
            return #imageLiteral(resourceName: "ICON-jinzhunkehu")
        case 2:
            return #imageLiteral(resourceName: "ICON-youzhikehu")
        default:
            return UIImage()
        }
    }
    
    func getpledgeType() ->String {
        switch client_mortgage_asset {
        case 1:
            return "房屋抵押"
        case 2:
            return "车辆抵押"
        default:
            return ""
        }
    }
    
    func getHouseInfo() ->String {
        switch client_house_type {
        case 1:
            return "无房"
        case 2:
            return "有贷款房"
        case 3:
            return "有红本房"
        case 4:
            return "有小产权房"
        default:
            return ""
        }
    }
    
    func getCarInfo() ->String {
        switch client_car_type {
        case 1:
            return "无车"
        case 2:
            return "有全款车"
        case 3:
            return "有贷款车"
        default:
            return ""
        }
    }
}