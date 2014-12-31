//
//  ODMViewController.m
//  ODMSwipeSelector
//
//  Created by Oscar De Moya on 12/31/2014.
//  Copyright (c) 2014 Oscar De Moya. All rights reserved.
//

#import "ODMViewController.h"
#import "ODMSwipeSelector.h"

@interface ODMViewController ()

@property (weak, nonatomic) IBOutlet ODMSwipeSelector *heightSelector;
@property (weak, nonatomic) IBOutlet ODMSwipeSelector *weightSelector;
@property (weak, nonatomic) IBOutlet ODMSwipeSelector *shirtSizeSelector;
@property (weak, nonatomic) IBOutlet ODMSwipeSelector *shoesSizeSelector;

@end

@implementation ODMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.heightSelector.unit = MCDMeasureFormatInch;
    self.weightSelector.unit = MCDMeasureFormatInt;
    self.shirtSizeSelector.unit = MCDMeasureFormatSize;
    self.shoesSizeSelector.unit = MCDMeasureFormatFloat;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
