//
//  NovaSolucaoViewController.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "NovaSolucaoViewController.h"

@interface NovaSolucaoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *infoLabelVideo;
@property (weak, nonatomic) IBOutlet UILabel *infoLabelAnexo;
@property (weak, nonatomic) IBOutlet UILabel *infoLabelHabilidades;

@end

@implementation NovaSolucaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [_infoLabelVideo setFont:[UIFont systemFontOfSize:15]];
//    [_infoLabelAnexo setFont:[UIFont systemFontOfSize:15]];
//    [_infoLabelHabilidades setFont:[UIFont systemFontOfSize:15]];
//    
    self.descricaoTxt.layer.borderWidth = 0.5f;
    self.descricaoTxt.layer.borderColor = [[UIColor grayColor] CGColor];

  
    

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
