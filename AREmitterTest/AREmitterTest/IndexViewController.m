//
//  IndexViewController.m
//  AREmitterTest
//
//  Created by Ethan on 2018/1/30.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import "IndexViewController.h"
#import "ViewController.h"

static NSString *cellID = @"cell";

@interface IndexViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_dataArray = @[@"Bokeh", @"Rain", @"Confetti", @"Fire",
				   @"Reactor", @"Smoke", @"Stars"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
	
	if (!cell) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
	}
	
	NSString *title = [_dataArray objectAtIndex:indexPath.row];
	cell.textLabel.text = title;
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return  _dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return self.view.bounds.size.height / _dataArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

	ViewController *vc = [segue destinationViewController];
	UITableViewCell *cell = sender;
	vc.titleStr = cell.textLabel.text;
	
}


@end
