//
//  NovoProblemaViewController.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NovoProblemaViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnArea;

@property (weak, nonatomic) IBOutlet UITextView *descricaoTxt;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewNovoProblema;

- (IBAction)showActionArea:(id)sender;

@end
