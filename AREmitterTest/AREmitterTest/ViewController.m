//
//  ViewController.m
//  AREmitterTest
//
//  Created by Ethan on 2018/1/23.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) IBOutlet ARSCNView *sceneView;
@property (nonatomic, strong) SCNNode *audioNode;
@property (nonatomic, strong) SCNParticleSystem *particle;

@end

    
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.sceneView.delegate = self;
	
	/*
	 you can turn on the show statistics property to monitoring FPS eg.
	 */
    self.sceneView.showsStatistics = NO;

	/*
	 create scene & particle system
	 */
    SCNScene *scene = [SCNScene scene];
	self.particle = [SCNParticleSystem particleSystemNamed:[NSString stringWithFormat:@"%@.scnp", _titleStr] inDirectory:nil];
	[scene addParticleSystem:self.particle withTransform:SCNMatrix4Identity];
	
	self.sceneView.scene = scene;
	
	/*
	 create a button for pause the particle moving
	 */
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.frame = self.view.bounds;
	[button addTarget:self action:@selector(pauseBT:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	[self.view bringSubviewToFront:button];
	
}

- (void)pauseBT:(UIButton *)sender{
	[sender setSelected:!sender.selected];
	/*
	 we can control the particle move speed through 'speedFactor'
	 */
	self.particle.speedFactor = sender.selected ? 0 : 2;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];

    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)backEvent:(UISwipeGestureRecognizer *)sender {
	if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
		[self dismissViewControllerAnimated:NO completion:nil];
	}
}
#pragma mark - ARSCNViewDelegate

/*
// Override to create and configure nodes for anchors added to the view's session.
- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    SCNNode *node = [SCNNode new];
 
    // Add geometry to the node...
 
    return node;
}
*/

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

@end
