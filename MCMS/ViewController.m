//
//  ViewController.m
//  MCMS
//
//  Created by AE on 5/20/14.
//  Copyright (c) 2014 Aaron Eckhart. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@property (weak, nonatomic) IBOutlet UITableView *creaturesTableView;

@end

@implementation ViewController


- (IBAction)onAddButtonPressed:(id)sender
{
    NSString *newCreatureText = self.inputTextField.text;
    MagicalCreature *newMagicalCreature = [[MagicalCreature alloc] init];
    newMagicalCreature.name = newCreatureText;
    NSLog (@"%@", newMagicalCreature.name);

    [self.creatures addObject:newMagicalCreature];

    [self.creaturesTableView reloadData];


    [self.inputTextField resignFirstResponder];

    self.inputTextField.text = @"";



}

- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *creature1 = [[MagicalCreature alloc] init];
    creature1.name = @"Unicorn";
    creature1.description = @"One horned horse";
    creature1.creatureImage = [UIImage imageNamed:@"Stripper_Unicorn"];

    MagicalCreature *creature2 = [[MagicalCreature alloc] init];
    creature2.name = @"Hydra";
    creature2.description = @"Seven headed dragon";
    creature2.creatureImage = [UIImage imageNamed:@"Winged_Hydra"];
    MagicalCreature *creature3 = [[MagicalCreature alloc] init];
    creature3.name = @"Kracken";
    creature3.description = @"Underwater beast";
    creature3.creatureImage = [UIImage imageNamed:@"keep-calm-and-release-the-kraken-9"];

    self.view.backgroundColor = [UIColor blackColor];



    self.creatures = [[NSMutableArray alloc] initWithObjects:creature1, creature2, creature3, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d", self.creatures.count);
    return self.creatures.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    MagicalCreature *selectedCreature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = selectedCreature.name;
    cell.detailTextLabel.text = selectedCreature.description;

    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureDetailViewController *nextViewController = [segue destinationViewController];

    NSIndexPath *myPath = [self.creaturesTableView indexPathForSelectedRow];
    MagicalCreature *selectedCreature = [self.creatures objectAtIndex:myPath.row];

    nextViewController.creature = selectedCreature;
    
}

- (IBAction) unwindSegue:(UIStoryboardSegue *)sender
{

    NSIndexPath *myPath = [self.creaturesTableView indexPathForSelectedRow];
    MagicalCreature *selectedCreature = [self.creatures objectAtIndex:myPath.row];
    CreatureDetailViewController *previousVC = [sender sourceViewController];
    selectedCreature = previousVC.creature;

    [self.creaturesTableView reloadData];


}




@end
