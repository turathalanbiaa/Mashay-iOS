//
//  Place.swift
//  Mashay
//
//  Created by AliMac on 10/19/17.
//  Copyright © 2017 TurathAlanbiaa. All rights reserved.
//

import UIKit
import CoreLocation

class Place
{
    
    var longitude : Double;
    var latitude : Double;
    var title : String;
    var colNo : Int;
    var category : Int;
    
    init(longitude : Double , latitude : Double , title : String , colNo : Int , category : Int)
    {
        self.longitude = longitude;
        self.latitude =  latitude;
        self.title = title;
        self.colNo = colNo;
        self.category = category;
    }
    
    
    func distance(place : Place) -> Double
    {
        let location1 = CLLocation(latitude: place.latitude, longitude: place.longitude);
        let location2 = CLLocation(latitude: self.latitude, longitude: self.longitude);
        return location1.distance(from: location2);
    }
    
    static func nearestPlace(longitude : Double , latitude : Double) -> Place
    {
        let givenPlace = Place(longitude : longitude , latitude : latitude , title : "" , colNo : 0 , category : 0);
        var minDistancePlace : Place? = nil;
        for place : Place in Place.all
        {
            if minDistancePlace == nil {
                minDistancePlace = place;
                continue;
            }
            
            if place.latitude < latitude
            {
                continue;
            }
            
            let distance = givenPlace.distance(place: place);
            print(String(place.colNo) + " - " + String(distance));
            if distance < givenPlace.distance(place: minDistancePlace!)
            {
                minDistancePlace = place;
            }
        }
        
        return minDistancePlace!;
    }
    
    static var all = [
        Place(longitude: 44.3190385, latitude: 32.0617719, title: "مفرق الطريق الحولي - مقابل الملعب الأولمبي ", colNo: 1, category : 3),
        Place(longitude: 44.3196653, latitude: 32.0661661, title: "مركز سيد الشهداء الصحي ", colNo: 11, category : 1),
        Place(longitude: 44.321931, latitude: 32.0938539, title: " مركز ارشاد التائهين ", colNo: 73, category : 2),
        Place(longitude: 44.3229497, latitude: 32.1021243, title: " مستشفى المناذره العام ", colNo: 90, category : 1),
        Place(longitude: 44.3233029, latitude: 32.1047049, title: " مركز العتبة العلوية ", colNo: 96, category : 3),
        Place(longitude: 44.3243512, latitude: 32.1142655, title: " شركة ربان السفينة لصناعة الكهربائيات ", colNo: 118, category : 3),
        Place(longitude: 44.3246552, latitude: 32.1198627, title: " مفرزة طبية / دائرة صحة النجف ", colNo: 130, category : 1),
        Place(longitude: 44.3263469, latitude: 32.1355332, title: " مركز نور الحسين للعلاج الطبيعي ", colNo: 164, category : 1),
        Place(longitude: 44.3262314, latitude: 32.1399328, title: " البيت الصحي / دائرة صحة النجف", colNo: 173, category : 1),
        Place(longitude: 44.3261775, latitude: 32.1408684, title: " مفرزة طبية هيئة الامامين العسكريين / صحة النجف ", colNo: 175, category : 1),
        Place(longitude: 44.3223055, latitude: 32.1513342, title: "موكب آل كرماشة ", colNo: 200, category : 3),
        Place(longitude: 44.3211173, latitude: 32.1546568, title: " موكب العتبتين الحسينيه والعباسيه", colNo: 208, category : 3),
        Place(longitude: 44.3196573, latitude: 32.1585197, title: " مفرزه طبيه قسم الصحة العامة دائره صحه النجف", colNo: 217, category : 1),
        Place(longitude: 44.3171828, latitude: 32.165352, title: " مفرزة بطلة كربلاء الطبيه", colNo: 232, category : 1),
        Place(longitude: 44.3168372, latitude: 32.1663724, title: "وقف العتبة العلوية المقدسه", colNo: 235, category : 3),
        Place(longitude: 44.3153538, latitude: 32.1703651, title: " مفرزه طبية دائره صحة النجف / مركز الامام الجواد ", colNo: 244, category : 1),
        Place(longitude: 44.3086783, latitude: 32.1888889, title: " مفرزه طبيه / مستشفى الفرات الاوسط", colNo: 287, category : 1),
        Place(longitude: 44.3067384, latitude: 32.1948719, title: "موكب خدمة اهل البيت ", colNo: 300, category : 3),
        Place(longitude: 44.2999461, latitude: 32.2154153, title: "مفرق الكفل ومحطة الوقود ", colNo: 348, category : 3),
        Place(longitude: 44.299508, latitude: 32.2172036, title: " مفرزه طبيه قسم الصيدله دائرة صحة النجف", colNo: 351, category : 1),
        Place(longitude: 44.2942142, latitude: 32.2329881, title: " حسينية موظفي الشركة العامة للسمنت الجنوبيه +صيدليه", colNo: 387, category : 1),
        Place(longitude: 44.2923953, latitude: 32.2384062, title: "حسينية حميدة بنت مسلم ", colNo: 400, category : 3),
        Place(longitude: 44.2905178, latitude: 32.2441458, title: "مفرق مصفى النجف الاشرف", colNo: 412, category : 3),
        Place(longitude: 44.2896675, latitude: 32.2461769, title: "حسينية وموكب الامام الحسن /مفرزة طبية", colNo: 418, category : 1),
        Place(longitude: 44.2849218, latitude: 32.2603853, title: " مركز الحسين الطبي", colNo: 450, category : 1),
        Place(longitude: 44.2835169, latitude: 32.2677772, title: " مركز مابين الحرمين للرعاية الصحية الاوليه / دائرة صحة النجف الاشرف ", colNo: 566, category : 1),
        Place(longitude: 44.282808, latitude: 32.2717008, title: " موكب الحوزة العلمية", colNo: 475, category : 3),
        Place(longitude: 44.2819124, latitude: 32.2753628, title: "مفرزة طبية/ موكب الشهيد الصدر ", colNo: 483, category : 1),
        Place(longitude: 44.2799861, latitude: 32.28264, title: "حسينية الباقيات الصالحات ", colNo: 500, category : 3),
        Place(longitude: 44.2755851, latitude: 32.3026883, title: "قوس دخول بلدية الحيدريه", colNo: 544, category : 3),
        Place(longitude: 44.2747815, latitude: 32.3049935, title: " مركز صحي العروبة / دائرة صحة النجف ", colNo: 550, category : 1),
        Place(longitude: 44.27149, latitude: 32.3168169, title: " مستشفى الحيدرية العام", colNo: 579, category : 1),
        Place(longitude: 44.2655844, latitude: 32.3235941, title: " مركز الرعاية الصحية الاوليه في الحيدريه / دائرة صحة النجف ", colNo: 598, category : 1),
        Place(longitude: 44.2647938, latitude: 32.3240618, title: "مركز شرطة + المصرف الزراعي ", colNo: 600, category : 3),
        Place(longitude: 44.2561795, latitude: 32.3329175, title: " قوس الخروج من مدينة الحيدرية", colNo: 625, category : 3),
        Place(longitude: 44.2455782, latitude: 32.3439131, title: " سيطرة دخول وخروج الحيدرية", colNo: 657, category : 3),
        Place(longitude: 44.2401127, latitude: 32.3503327, title: "سيطرة الحدود الاداريه لمحافظة كربلاء ", colNo: 673, category : 3),
        Place(longitude: 44.2331779, latitude: 32.3604339, title: "موكب أنصار الحسين ", colNo: 700, category : 3),
        Place(longitude: 44.2271956, latitude: 32.3686141, title: "حسينية جنة الحسين ", colNo: 721, category : 3),
        Place(longitude: 44.2247636, latitude: 32.3722956, title: " موكب ومفرزة طبية أبا الفضل العباس / اهالي العماره", colNo: 730, category : 1),
        Place(longitude: 44.211773, latitude: 32.39045, title: "حسينية المعجزة الحسينية", colNo: 777, category : 3),
        Place(longitude: 44.2103614, latitude: 32.3924111, title: " مفرزة طبية رقم 27 / دائرة صحة كربلاء", colNo: 782, category : 1),
        Place(longitude: 44.2081916, latitude: 32.3953593, title: " موكب وحسينية وارث ", colNo: 790, category : 3),
        Place(longitude: 44.2064011, latitude: 32.3977744, title: " مركز النجف الاشرف الطبي / مستشفى الحكيم العام دائرة صحة النجف", colNo: 796, category : 1),
        Place(longitude: 44.2054492, latitude: 32.3990803, title: "موكب وحسينية أهالي الكويت ", colNo: 800, category : 3),
        Place(longitude: 44.1976269, latitude: 32.4101126, title: "موكب صاحب الزمان ", colNo: 829, category : 3),
        Place(longitude: 44.1962731, latitude: 32.4119277, title: " جامعة اهل البيت", colNo: 834, category : 3),
        Place(longitude: 44.1866057, latitude: 32.4253811, title: " قسم الصيانة شعبة معالجة المياه / العتبة الحسينيه", colNo: 869, category : 3),
        Place(longitude: 44.1801411, latitude: 32.4343873, title: " مؤسسة اليتيم الخيريه", colNo: 892, category : 3),
        Place(longitude: 44.1781515, latitude: 32.4375854, title: "موكب شباب زين العابدين ", colNo: 900, category : 3),
        Place(longitude: 44.1749659, latitude: 32.4428808, title: " محطة تعبئة وقود نور القائم المشيدة", colNo: 913, category : 3),
        Place(longitude: 44.162863, latitude: 32.4627558, title: "سيطرة دخول كربلاء 52", colNo: 960, category : 3),
        Place(longitude: 44.1564364, latitude: 32.4735712, title: " مفرق خان النخيلة", colNo: 989, category : 3),
        Place(longitude: 44.1536987, latitude: 32.4779234, title: "حسينية الاحسان ", colNo: 1000, category : 3),
        Place(longitude: 44.1520277, latitude: 32.4807543, title: " مفرزة طبية رقم 25 / دائرة صحة كربلاء", colNo: 1007, category : 1),
        Place(longitude: 44.1440235, latitude: 32.493358, title: " مركز ارشاد التائهين / العتبة العباسية ", colNo: 1038, category : 2),
        Place(longitude: 44.1345838, latitude: 32.5033263, title: " مدينة الامام الحسن للزائرين", colNo: 1067, category : 3),
        Place(longitude: 44.1260453, latitude: 32.5128995, title: "جمعية النور الخيرية", colNo: 1092, category : 3),
        Place(longitude: 44.1241058, latitude: 32.5155533, title: " مضيف العتبة العباسية المقدسة ", colNo: 1100, category : 3),
        Place(longitude: 44.122986, latitude: 32.5167476, title: " مركز ارشاد التائهين", colNo: 1103, category : 2),
        Place(longitude: 44.119996, latitude: 32.5200613, title: " كلية ابن حيان الجامعة", colNo: 1112, category : 3),
        Place(longitude: 44.107675, latitude: 32.5337357, title: " مرآب +محطة وقود / على الجانب الثاني", colNo: 1149, category : 3),
        Place(longitude: 44.0926704, latitude: 32.5435773, title: "سيطرة دخول كربلاء", colNo: 1184, category : 3),
        Place(longitude: 44.0865927, latitude: 32.5479204, title: "موكب القاسم ", colNo: 1200, category : 3),
        Place(longitude: 44.0730418, latitude: 32.5570768, title: " كلية الطب العام / العتبة العباسيه", colNo: 1238, category : 3),
        Place(longitude: 44.0724081, latitude: 32.5574711, title: "مركز ارشاد التائهين / العتبة العباسيه ", colNo: 1239, category : 2),
        Place(longitude: 44.0679102, latitude: 32.5605611, title: " محطة الحسين لتجارة الحبوب", colNo: 1252, category : 3),
        Place(longitude: 44.0604944, latitude: 32.5653085, title: "سايلو كربلاء", colNo: 1273, category : 3),
        Place(longitude: 44.054852, latitude: 32.5681358, title: " محطة الغاز فرع كربلاء المقدسة", colNo: 1290, category : 3),
        Place(longitude: 44.0533755, latitude: 32.5692502, title: "مفرق كربلاء الحولي ", colNo: 1294, category : 3),
        Place(longitude: 44.0553947, latitude: 32.5717382, title: "عمود 1300", colNo: 1300, category : 3), 
        Place(longitude: 44.0417429, latitude: 32.5918901, title: " مستشفى الكفيل التخصصي", colNo: 1379, category : 1), 
        Place(longitude: 44.0354186, latitude: 32.5971064, title: "عمود 1400", colNo: 1400, category : 3), 
        Place(longitude: 44.031895, latitude: 32.5981473, title: "مفرق سيد جوده", colNo: 1406, category : 3), 
        Place(longitude: 44.0333413, latitude: 32.6043489, title: "معهد الكفيل لتقنية المعلومات وتطوير المهارات", colNo: 1422, category : 3),
    ];

    
}
