//
//  ViewController.m
//  Objective C Lab Ball
//
//  Created by Akram Elhayani on 23/01/2022.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic , strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIView *orangBall;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UICollisionBehavior *collesion;
@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc ] init];
    _collesion =[[UICollisionBehavior alloc ] init];
    [_collesion setTranslatesReferenceBoundsIntoBoundary:YES];
    [self.animator  addBehavior:_gravity];
    [self.animator addBehavior:_collesion];
    [_collesion setCollisionDelegate:self];
    [_collesion addItem:_view2];
    
  
    
    
  }
-(void) collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p {
 
    UIView *v1 = item1;
    UIView *v2 = item2;
    UIView *ball = nil;
    
    printf("%s %li \n","Collsion",(long)ball.tag);
    if(v1.tag ==10 && v2.tag == 10 &&  v1.frame.size.width >=v2.frame.size.width)
        ball = v1;
    else if(v1.tag ==10 && v2.tag == 10 &&  v2.frame.size.width >=v1.frame.size.width)
        ball = v2;
    else if(v1.tag ==10 )
        ball = v1;
    else
        ball = v2;
    
    if(ball.frame.size.width <5)
        return;
    ball.hidden =YES;
    [_collesion removeItem:ball];
    
 
    [self addOrangBall:ball.frame.size.width/2 locationX:ball.frame.origin.x locationY:ball.frame.origin.y];
    [self addOrangBall:ball.frame.size.width/2 locationX:ball.frame.origin.x+(v1.frame.size.width/1.5) locationY:ball.frame.origin.y-100];
    
    
}
-(void) demoGravity:(UIView*)vw{
    [_gravity addItem:vw];
    [_collesion addItem:vw];
   
 
   
}

-(UIView*) addOrangBall:(int)size {
    
   
   
    return  [self addOrangBall:size locationX:0 locationY:0];
    
}
-(UIView*) addOrangBall:(int)size locationX:(int)x locationY:(int)y{
    
    UIView *ball;
    ball = [[UIView alloc ] initWithFrame:CGRectMake(x, y, size, size)];
    ball. backgroundColor = [UIColor orangeColor];
    ball. layer. cornerRadius = size/2;
    ball. layer. borderColor
    = [UIColor blackColor].CGColor;
    ball. layer.borderWidth = 1.0;
    ball.tag=10;
    [self.view addSubview: ball];
    [self demoGravity:ball];
    return ball;
    
}
- (IBAction)swiped:(id)sender {
  
    
    [self addOrangBall:250];
}


@end
