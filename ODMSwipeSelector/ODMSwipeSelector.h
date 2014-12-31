//
//  ODMSwipeSelector.h
//  ODMSwipeSelector
//
//  Created by Oscar De Moya on 10/24/14.
//  Copyright (c) 2014 Oscar De Moya. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MCDMeasureFormat) {
    MCDMeasureFormatInt,
    MCDMeasureFormatFloat,
    MCDMeasureFormatInch,
    MCDMeasureFormatSize
};

typedef NS_ENUM(NSInteger, MCDMeasureSize) {
    MCDMeasureSizeXXS,
    MCDMeasureSizeXS,
    MCDMeasureSizeS,
    MCDMeasureSizeM,
    MCDMeasureSizeL,
    MCDMeasureSizeXL,
    MCDMeasureSizeXXL
};

IB_DESIGNABLE
@interface ODMSwipeSelector : UIView

@property (nonatomic) IBInspectable UIColor *minSwipingColor;
@property (nonatomic) IBInspectable UIColor *maxSwipingColor;
@property (nonatomic) IBInspectable UIColor *defaultLabelColor;
@property (nonatomic) IBInspectable UIColor *swipingLabelColor;
@property (nonatomic) IBInspectable float value;
@property (nonatomic) IBInspectable float minimumValue;
@property (nonatomic) IBInspectable float maximumValue;
@property (nonatomic) IBInspectable float incrementValue;
@property (nonatomic) IBInspectable NSString *title;

@property (assign, nonatomic) MCDMeasureFormat unit;

@end
