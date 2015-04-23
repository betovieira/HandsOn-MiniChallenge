//
//  NovoProblemaViewController.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "NovoProblemaViewController.h"

@interface NovoProblemaViewController ()

@end

@implementation NovoProblemaViewController

- (void)viewDidLoad {
    [_infoLabel setFont:[UIFont systemFontOfSize:15]];
    self.descricaoTxt.layer.borderWidth = 0.5f;
    self.descricaoTxt.layer.borderColor = [[UIColor grayColor] CGColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
