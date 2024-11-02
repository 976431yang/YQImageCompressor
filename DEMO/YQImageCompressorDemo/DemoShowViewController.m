//
//  DemoShowViewController.m
//  YQImageCompressorDemo
//
//  Created by problemchild on 16/8/9.
//  Copyright © 2016年 ProblenChild. All rights reserved.
//
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kViewMaxY(v)  (v.frame.origin.y + v.frame.size.height)


#import "DemoShowViewController.h"

@interface DemoShowViewController ()

@end

@implementation DemoShowViewController

#pragma mark --------LazyLoad
- (UIImage *)oldIMG {
    _oldIMG = (_oldIMG)?_oldIMG:[UIImage imageNamed:@"test.png"];
    return _oldIMG;
}

- (UIImageView *)oldIMGV {
    if(!_oldIMGV){
        _oldIMGV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64,
                                                                kScreenWidth,
                                                                (kScreenHeight-64-30)/2)];
        _oldIMGV.layer.masksToBounds = YES;
        _oldIMGV.contentMode = UIViewContentModeScaleAspectFit;
        _oldIMGV.image = self.oldIMG;
        _oldIMGV.backgroundColor = [UIColor colorWithRed:0.388 green:0.666 blue:1.000 alpha:1.000];
    }
    return _oldIMGV;
}

- (UIImageView *)newIMGV {
    if(!_newIMGV){
        _newIMGV = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                kViewMaxY(self.oldIMGV)+15,
                                                                kScreenWidth,
                                                                (kScreenHeight-64-30)/2)];
        _newIMGV.layer.masksToBounds = YES;
        _newIMGV.contentMode = UIViewContentModeScaleAspectFit;
        _newIMGV.backgroundColor = [UIColor colorWithRed:1.000 green:0.318 blue:0.333 alpha:1.000];
    }
    return _newIMGV;
}

- (CGSize)newIMGSize {
    return CGSizeMake(self.newIMGV.frame.size.width * 2,
                      self.newIMGV.frame.size.height * 2);
}


#pragma mark --------System

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark --------Functions
//初始化
-(void)setup{
    
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor  = [UIColor whiteColor];
    
    if(self.titleStr.length>0){
        self.title = self.titleStr;
    }
    
    [self.view addSubview:self.oldIMGV];
    [self.view addSubview:self.newIMGV];
}

//弹窗提示结果
-(void)alertResult:(NSString *)string{
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"压缩结果"
                   message:string
                   delegate:nil
                   cancelButtonTitle:@"OK"
                   otherButtonTitles: nil];
    [alertDialog show];
}

@end
