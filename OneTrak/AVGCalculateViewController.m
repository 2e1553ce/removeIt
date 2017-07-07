//
//  AVGCalculateViewController.m
//  OneTrak
//
//  Created by aiuar on 07.07.17.
//  Copyright © 2017 A.V. All rights reserved.
//

#import "AVGCalculateViewController.h"
#import "AVGCalculateService.h"
#import "AVGResultLabel.h"
#import "AVGTextField.h"

@interface AVGCalculateViewController ()

@property (nonatomic, strong) AVGCalculateService *calculateService;
@property (nonatomic, assign) NSUInteger counter;

@property (nonatomic, strong) AVGResultLabel *resultLabel;
@property (nonatomic, strong) UILabel *counterLabel;
@property (nonatomic, strong) AVGTextField *textField;
@property (nonatomic, strong) UIButton *calculateButton;
@property (nonatomic, strong) UIButton *resetButton;

@end

@implementation AVGCalculateViewController

#pragma mark - Initialization

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.calculateService = [AVGCalculateService new];
    self.counter = 0;
    [self configurateViews];
}

#pragma mark - Views configuration

- (void)configurateViews {
    self.resultLabel = [AVGResultLabel new];
    self.textField = [AVGTextField new];
    
    self.counterLabel = [UILabel new];
    self.counterLabel.backgroundColor = UIColor.middleGrayColor;
    self.counterLabel.font = UIFont.counterLabel;
    self.counterLabel.textAlignment = NSTextAlignmentRight;
    self.counterLabel.text = @"#";
    
    self.calculateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.calculateButton.backgroundColor = UIColor.middleGrayColor;
    [self.calculateButton setTitle:@"Посчитать" forState:UIControlStateNormal];
    self.calculateButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.calculateButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    [self.calculateButton addTarget:self action:@selector(calculateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.resetButton.backgroundColor = UIColor.middleGrayColor;
    [self.resetButton setTitle:@"Заново" forState:UIControlStateNormal];
    [self.resetButton addTarget:self action:@selector(resetButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.resultLabel];
    [self.view addSubview:self.counterLabel];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.calculateButton];
    [self.view addSubview:self.resetButton];
    
    CGFloat navOffset = CGRectGetHeight(self.navigationController.navigationBar.frame);
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(navOffset + 26);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view.mas_centerX).with.offset(-10);
        make.height.equalTo(@62);
    }];
    
    [self.counterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(navOffset + 26);
        make.left.equalTo(self.view.mas_centerX).with.offset(10);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.equalTo(@62);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.resultLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view.mas_centerX).with.offset(-10);
        make.height.equalTo(@42);
    }];
    
    [self.calculateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.resultLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.view.mas_centerX).with.offset(10);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.equalTo(@42);
    }];
    
    [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.calculateButton.mas_bottom).with.offset(8);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.equalTo(@30);
    }];
}

#pragma mark - Actions 

- (void)calculateButtonAction:(UIButton *)sender {
    if ([self.textField.text isEqualToString:@""]) {
        NSLog(@"Empty");
    } else {
        NSInteger number = [self.textField.text integerValue];
        number = [self.calculateService squareNumber:number];
        if (number < 0) {
            [self showAlert];
        } else {
            NSString *calculatedNumber = [NSString stringWithFormat:@"%ld", (long)number];
            self.counter++;
            
            self.resultLabel.text = calculatedNumber;
            self.counterLabel.text = [NSString stringWithFormat:@"%ld", (long)self.counter];
        }

    }
}

- (void)resetButtonAction:(UIButton *)sender {
    self.resultLabel.text = @"результат";
    self.counterLabel.text = @"#";
    self.textField.text = @"";
    self.counter = 0;
}

#pragma mark - Alerts

- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                             message:@"Слишком большое число"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ок"
                                                        style:UIAlertActionStyleDefault
                                                      handler:nil];
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
