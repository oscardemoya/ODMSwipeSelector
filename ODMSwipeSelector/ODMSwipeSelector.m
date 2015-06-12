//
//  ODMSwipeSelector.m
//  ODMSwipeSelector
//
//  Created by Oscar De Moya on 10/24/14.
//  Copyright (c) 2014 Oscart. All rights reserved.
//

#import "ODMSwipeSelector.h"

@interface ODMSwipeSelector ()

@property (assign, nonatomic) float newValue;
@property (assign, nonatomic) float minSwipeRed;
@property (assign, nonatomic) float maxSwipeRed;
@property (assign, nonatomic) float minSwipeGreen;
@property (assign, nonatomic) float maxSwipeGreen;
@property (assign, nonatomic) float minSwipeBlue;
@property (assign, nonatomic) float maxSwipeBlue;
@property (assign, nonatomic) float minSwipeAlpha;
@property (assign, nonatomic) float maxSwipeAlpha;
@property (strong, nonatomic) UIView *trackView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *valueLabel;
@property (strong, nonatomic) UIColor *originalBackgroundColor;

@end

@implementation ODMSwipeSelector

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self configureSwipeSelector];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSwipeSelector];
    }
    return self;
}

- (void)configureSwipeSelector {
    self.clipsToBounds = YES;
    [self setDefaultPropertyValues];
    [self addGesture];
    [self addTrackView];
    [self addTitleLabel];
    [self addValueLabel];
}

- (void)setDefaultPropertyValues {
    self.minSwipingColor = [UIColor grayColor];
    self.maxSwipingColor = [UIColor blackColor];
    self.defaultLabelColor = [UIColor blackColor];
    self.swipingLabelColor = [UIColor whiteColor];
    self.originalBackgroundColor = self.backgroundColor;
    self.value = 0;
    self.minValue = 0;
    self.maxValue = 10;
    self.incrementValue = 1;
    self.maxIncrementValue = 5;
    self.title = @"Label";
}

- (void)awakeFromNib {
    self.titleLabel.text = self.title;
    [self updateValueLabelWithValue:self.value];
}

- (void)addGesture {
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:panRecognizer];
}

- (void)addTrackView {
    self.trackView = [[UIView alloc] initWithFrame:self.frame];
    self.trackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.trackView];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[trackView]-0-|"
                                                                             options:NSLayoutFormatAlignAllCenterY
                                                                             metrics:nil
                                                                               views:@{@"trackView": self.trackView}];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[trackView]-0-|"
                                                                           options:NSLayoutFormatAlignAllCenterX
                                                                           metrics:nil
                                                                             views:@{@"trackView": self.trackView}];
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
}

- (void)addTitleLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:self.frame];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleLabel];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[titleLabel(<=self)]-0-|"
                                                                             options:NSLayoutFormatAlignAllCenterY
                                                                             metrics:nil
                                                                               views:@{@"titleLabel": self.titleLabel, @"self": self}];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[titleLabel]-0-|"
                                                                           options:NSLayoutFormatAlignAllCenterX
                                                                           metrics:nil
                                                                             views:@{@"titleLabel": self.titleLabel}];
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
}

- (void)addValueLabel {
    self.valueLabel = [[UILabel alloc] initWithFrame:self.frame];
    self.valueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.valueLabel];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[valueLabel(<=self)]-20-|"
                                                                             options:NSLayoutFormatAlignAllCenterY
                                                                             metrics:nil
                                                                               views:@{@"valueLabel": self.valueLabel, @"self": self}];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[valueLabel]-0-|"
                                                                           options:NSLayoutFormatAlignAllCenterX
                                                                           metrics:nil
                                                                             views:@{@"valueLabel": self.valueLabel}];
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
    self.valueLabel.textAlignment = NSTextAlignmentRight;
}

#pragma mark - Accessors

- (void)setMinSwipingColor:(UIColor *)minSwipingColor {
    _minSwipingColor = minSwipingColor;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    if ([minSwipingColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [minSwipingColor getRed:&red green:&green blue:&blue alpha:&alpha];
    } else {
        const CGFloat *components = CGColorGetComponents(minSwipingColor.CGColor);
        red = components[0];
        green = components[1];
        blue = components[2];
        alpha = components[3];
    }
    self.minSwipeRed = red * 255;
    self.minSwipeGreen = green * 255;
    self.minSwipeBlue = blue * 255;
    self.minSwipeAlpha = alpha;
}

- (void)setMaxSwipingColor:(UIColor *)maxSwipingColor {
    _maxSwipingColor = maxSwipingColor;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    if ([maxSwipingColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [maxSwipingColor getRed:&red green:&green blue:&blue alpha:&alpha];
    } else {
        const CGFloat *components = CGColorGetComponents(maxSwipingColor.CGColor);
        red = components[0];
        green = components[1];
        blue = components[2];
        alpha = components[3];
    }
    self.maxSwipeRed = red * 255;
    self.maxSwipeGreen = green * 255;
    self.maxSwipeBlue = blue * 255;
    self.maxSwipeAlpha = alpha;
}

- (void)setDefaultLabelColor:(UIColor *)defaultLabelColor {
    _defaultLabelColor = defaultLabelColor;
    self.titleLabel.textColor = defaultLabelColor;
    self.valueLabel.textColor = defaultLabelColor;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setValue:(float)value {
    _value = value;
    [self updateValueLabelWithValue:value];
}

- (void)setUnit:(ODMMeasureFormat)unit {
    _unit = unit;
    [self updateValueLabelWithValue:self.value];
}

#pragma mark - Private

- (NSString *)sizeStringWithValue:(float)value {
    ODMMeasureSize size = (int)value;
    static NSArray *values;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        values = @[@"XXS", @"XS", @"S", @"M", @"L", @"XL", @"XXL"];
    });
    if (size >= 0 || size < [values count]) {
        return values[size];
    }
    return nil;
}

- (void)updateValueLabelWithValue:(float)value {
    if ([self.delegate respondsToSelector:@selector(swipeSelector:willChangeToValue:)]) {
        [self.delegate swipeSelector:self willChangeToValue:value];
    }
    
    switch (self.unit) {
        case ODMMeasureFormatInt:
            self.valueLabel.text = [NSString stringWithFormat:@"%d", (int)value];
            break;
            
        case ODMMeasureFormatFloat:
            self.valueLabel.text = [NSString stringWithFormat:@"%.1f", value];
            break;
            
        case ODMMeasureFormatInch:
            self.valueLabel.text = [NSString stringWithFormat:@"%.1f\"", value];
            break;
            
        case ODMMeasureFormatSize:
            self.valueLabel.text = [self sizeStringWithValue:value];
            break;
            
        default:
            break;
    }
    
    if ([self.delegate respondsToSelector:@selector(swipeSelector:didChangeToValue:)]) {
        [self.delegate swipeSelector:self didChangeToValue:value];
    }
}

- (NSLayoutConstraint *)leftSpaceBetweenSuperview:(UIView *)superview andChildView:(UIView *)view {
    for (NSLayoutConstraint *constraint in superview.constraints) {
        if (constraint.firstItem == view && constraint.secondItem == superview && constraint.firstAttribute == NSLayoutAttributeLeading) {
            return constraint;
        }
    }
    return nil;
}

- (NSLayoutConstraint *)rightSpaceBetweenSuperview:(UIView *)superview andChildView:(UIView *)view {
    for (NSLayoutConstraint *constraint in superview.constraints) {
        if (constraint.firstItem == superview && constraint.secondItem == view && constraint.firstAttribute == NSLayoutAttributeTrailing) {
            return constraint;
        }
    }
    return nil;
}

#pragma mark - Pan gestures

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    switch (recognizer.state) {
            
        case UIGestureRecognizerStateBegan: {
            [self startSwipeWithGesture:recognizer];
            break;
        }
            
        case UIGestureRecognizerStateChanged: {
            [self swipeWithGesture:recognizer];
            break;
        }
            
        case UIGestureRecognizerStateEnded: {
            if ([recognizer numberOfTouches] == 0) {
                [self endSwipeWithGesture:recognizer];
            }
            break;
        }
            
        default:
            break;
    }
    
}

- (void)startSwipeWithGesture:(UIPanGestureRecognizer *)recognizer {
    self.titleLabel.textColor = self.swipingLabelColor;
    self.valueLabel.textColor = self.swipingLabelColor;
    self.backgroundColor = [UIColor colorWithRed:self.minSwipeRed/255 green:self.minSwipeGreen/255 blue:self.minSwipeBlue/255 alpha:1];
}

- (void)swipeWithGesture:(UIPanGestureRecognizer *)recognizer {
    // Move track view
    NSLayoutConstraint *leftContraint = [self leftSpaceBetweenSuperview:self andChildView:self.trackView];
    NSLayoutConstraint *rightContraint = [self rightSpaceBetweenSuperview:self andChildView:self.trackView];
    CGPoint translation = [recognizer translationInView:recognizer.view];
    if (translation.x > 0 && translation.x <= self.frame.size.width) {
        leftContraint.constant = translation.x;
        rightContraint.constant = 0;
    } else if (translation.x < 0 && translation.x >= -self.frame.size.width) {
        leftContraint.constant = 0;
        rightContraint.constant = -translation.x;
    }
    
    // Change track view color
    CGFloat percentColor = MIN(1.25 - (self.trackView.frame.size.width / self.frame.size.width), 1);
    CGFloat red = (self.minSwipeRed + ((self.maxSwipeRed - self.minSwipeRed) * percentColor)) / 255;
    CGFloat green = (self.minSwipeGreen + ((self.maxSwipeGreen - self.minSwipeGreen) * percentColor)) / 255;
    CGFloat blue = (self.minSwipeBlue + ((self.maxSwipeBlue - self.minSwipeBlue) * percentColor)) / 255;
    self.trackView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    // Update current value
    float percent = (translation.x / self.frame.size.width);
    float increment = self.incrementValue * (int)((self.maxIncrementValue / self.incrementValue) * percent);
    float newValue = self.value + increment;
    if (newValue >= self.minValue && newValue <= self.maxValue) {
        self.newValue = newValue;
    } else if (newValue <= self.minValue) {
        self.newValue = self.minValue;
    } else if (newValue >= self.maxValue) {
        self.newValue = self.maxValue;
    }
    [self updateValueLabelWithValue:self.newValue];
}

- (void)endSwipeWithGesture:(UIPanGestureRecognizer *)recognizer {
    NSLayoutConstraint *leftContraint = [self leftSpaceBetweenSuperview:self andChildView:self.trackView];
    NSLayoutConstraint *rightContraint = [self rightSpaceBetweenSuperview:self andChildView:self.trackView];
    leftContraint.constant = 0;
    rightContraint.constant = 0;
    [self setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.2f animations:^{
        self.trackView.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = self.defaultLabelColor;
        self.valueLabel.textColor = self.defaultLabelColor;
        self.backgroundColor = self.originalBackgroundColor;
        [self layoutIfNeeded];
    }];
    
    // Update value
    self.value = self.newValue;
}

@end
