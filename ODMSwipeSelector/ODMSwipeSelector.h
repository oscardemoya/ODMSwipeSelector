//
//  ODMSwipeSelector.h
//  ODMSwipeSelector
//
//  Created by Oscar De Moya on 10/24/14.
//  Copyright (c) 2014 Oscart. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ODMSwipeSelector;

@protocol ODMSwipeSelectorDelegate <NSObject>
@optional
- (void)swipeSelector:(ODMSwipeSelector *)swipeSelector willChangeToValue:(float)value;
- (void)swipeSelector:(ODMSwipeSelector *)swipeSelector didChangeToValue:(float)value;
@end

typedef NS_ENUM(NSInteger, ODMMeasureFormat) {
    ODMMeasureFormatInt,
    ODMMeasureFormatFloat,
    ODMMeasureFormatInch,
    ODMMeasureFormatSize
};

typedef NS_ENUM(NSInteger, ODMMeasureSize) {
    ODMMeasureSizeXXS,
    ODMMeasureSizeXS,
    ODMMeasureSizeS,
    ODMMeasureSizeM,
    ODMMeasureSizeL,
    ODMMeasureSizeXL,
    ODMMeasureSizeXXL
};

IB_DESIGNABLE
@interface ODMSwipeSelector : UIView

@property (nonatomic) IBInspectable UIColor *minSwipingColor;
@property (nonatomic) IBInspectable UIColor *maxSwipingColor;
@property (nonatomic) IBInspectable UIColor *defaultLabelColor;
@property (nonatomic) IBInspectable UIColor *swipingLabelColor;
@property (nonatomic) IBInspectable float value;
@property (nonatomic) IBInspectable float minValue;
@property (nonatomic) IBInspectable float maxValue;
@property (nonatomic) IBInspectable float incrementValue;
@property (nonatomic) IBInspectable float maxIncrementValue;
@property (nonatomic) IBInspectable NSString *title;

@property (assign, nonatomic) ODMMeasureFormat unit;

@property (weak, nonatomic) id <ODMSwipeSelectorDelegate> delegate;

@end
