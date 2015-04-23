//
//  ConfigViewController.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/22/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewConfig;

@end

@implementation ConfigViewController

CGPoint pontoScroll;


- (IBAction)mudaFoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.novoNome resignFirstResponder];
    [self.novoEmail resignFirstResponder];
    [self.novoCurso resignFirstResponder];
    [self.novasHabilidades resignFirstResponder];
    [self.novaSenha resignFirstResponder];
    [self.confirmaNovaSenha resignFirstResponder];
    [self.scrollViewConfig setContentOffset:pontoScroll animated:YES];
}



- (IBAction)txtEditBegin:(id)sender {
    CGPoint p = pontoScroll;
    p.y += 200;
    [self.scrollViewConfig setContentOffset:p animated:YES];
    
}

- (IBAction)txtEditEnd:(id)sender{
    CGPoint p = pontoScroll;
    p.y -= 0;
    [self.scrollViewConfig setContentOffset:p animated:YES];
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
