//
//  ViewController.m
//  TransformPinYin
//
//  Created by fangd@silviscene.com on 2017/5/4.
//  Copyright © 2017年 skm. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Transform.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str = @"汉字转拼音";
    str = [NSString transformPinYinWithString:str];
    NSLog(@"汉字转拼音 : %@",str);
    NSArray *arrays = @[@"1,2,3,4,5,6"];
    NSString *string = [arrays componentsJoinedByString:@","];
    NSArray *array = [string componentsSeparatedByString:@","];
    NSLog(@"=string=--- %@",string);
    NSLog(@"=array=--- %@",array);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
