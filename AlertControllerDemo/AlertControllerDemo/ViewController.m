//
//  ViewController.m
//  AlertControllerDemo
//
//  Created by PanZaofeng on 15/9/20.
//  Copyright © 2015年 zfpanboy. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property(nonatomic, strong) UIButton *showOkayCancelButton;
@property(nonatomic, strong) UIButton *showMultipleActionsButton;
@property(nonatomic, strong) UIButton *showTextFieldActionButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.showOkayCancelButton];
    [self.view addSubview:self.showMultipleActionsButton];
    [self.view addSubview:self.showTextFieldActionButton];
    [self defineLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIButton*)showOkayCancelButton
{
    if(_showOkayCancelButton == nil)
    {
        _showOkayCancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_showOkayCancelButton setTitle:@"showOkayCancel" forState:UIControlStateNormal];
        [_showOkayCancelButton addTarget:self action:@selector(showOkayCancelAlert:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _showOkayCancelButton;
}

-(UIButton*)showMultipleActionsButton
{
    if(_showMultipleActionsButton == nil)
    {
        _showMultipleActionsButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_showMultipleActionsButton setTitle:@"showMultipleActions" forState:UIControlStateNormal];
        [_showMultipleActionsButton addTarget:self action:@selector(showMultipleActionsAlert:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _showMultipleActionsButton;
}

-(UIButton*)showTextFieldActionButton
{
    if(_showTextFieldActionButton == nil)
    {
        _showTextFieldActionButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_showTextFieldActionButton setTitle:@"showTextFieldActionButton" forState:UIControlStateNormal];
        [_showTextFieldActionButton addTarget:self action:@selector(showTextFieldActionAlert:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _showTextFieldActionButton;
}

-(void)defineLayout
{
    [self.showOkayCancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(150);
    }];
    
    [self.showMultipleActionsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.showOkayCancelButton.mas_bottom).with.offset(10);
    }];

    [self.showTextFieldActionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.showMultipleActionsButton.mas_bottom).with.offset(10);
    }];
}

-(void)showOkayCancelAlert:(id)sender
{
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A message should be a short, complete sentence.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *okButtonTitle = NSLocalizedString(@"OK", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The alert's cancel action occured.");
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The alert's ok action occured.");
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)showMultipleActionsAlert:(id)sender
{
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A message should be a short, complete sentence.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *okButtonTitle = NSLocalizedString(@"OK", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"Other", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The alert's cancel action occured.");
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The alert's ok action occured.");
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The alert's other action occured.");
    }];
    
    [alertController addAction:okAction];
    [alertController addAction:otherAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

-(void)showTextFieldActionAlert:(id)sender
{
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A message should be a short, complete sentence.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *okButtonTitle = NSLocalizedString(@"OK", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // 可以在这里对textfield进行定制，例如改变背景色
    }];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The alert's cancel action occured.");
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The alert's ok action occured.");
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
