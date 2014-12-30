//
//  MCDSwipeView.h
//  MacysDemo
//
//  Created by Oscar De Moya on 10/24/14.
//  Copyright (c) 2014 Koombea Inc. All rights reserved.
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
@interface MCDSwipeView : UIView

@property (nonatomic) IBInspectable UIColor *minSwipingColor;
@property (nonatomic) IBInspectable UIColor *maxSwipingColor;
@property (nonatomic) IBInspectable UIColor *defaultLabelColor;
@property (nonatomic) IBInspectable UIColor *swipingLabelColor;
@property (nonatomic) IBInspectable float value;
@property (nonatomic) IBInspectable float minimumValue;
@property (nonatomic) IBInspectable float maximumValue;
@property (nonatomic) IBInspectable float incrementValue;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (assign, nonatomic) MCDMeasureFormat unit;

@end
