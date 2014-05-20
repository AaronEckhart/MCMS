//
//  CreatureDetailViewController.m
//  MCMS
//
//  Created by AE on 5/20/14.
//  Copyright (c) 2014 Aaron Eckhart. All rights reserved.
//

#import "CreatureDetailViewController.h"

@interface CreatureDetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;



@end

@implementation CreatureDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = self.creature.name;
    self.descriptionLabel.text = self.creature.description;
    self.creatureImageView.image = self.creature.creatureImage;
    self.view.backgroundColor = [UIColor blackColor];


}

- (IBAction)onEditButtonPushed:(id)sender
{
    self.editing =! self.editing;
    if (self.editing)
    {
        [self.editButton setTitle:@"Done" forState:UIControlStateNormal];
        self.inputTextField.text = self.nameLabel.text;
    } else {
        [self.editButton setTitle:@"Edit" forState:UIControlStateNormal];
        self.nameLabel.text = self.inputTextField.text;
        self.creature.name = self.nameLabel.text;

}




    [self.inputTextField resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.nameLabel.text = textField.text;

    NSLog(@"working");

    [textField resignFirstResponder];

    return YES;
}




@end
