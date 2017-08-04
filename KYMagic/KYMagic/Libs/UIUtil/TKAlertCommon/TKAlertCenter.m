//
//  TKAlertCenter.m
//


#import "TKAlertCenter.h"
#import "UIView+TKCategory.h"

#pragma mark -
@interface TKAlertView : UIView {
	CGRect _messageRect;
	NSString *_text;
	UIImage *_image;
}

- (id) init;
- (void) setMessageText:(NSString*)str;
- (void) setImage:(UIImage*)image;

@end


#pragma mark -
@implementation TKAlertView

- (id) init{
	if(!(self = [super initWithFrame:CGRectMake(0, 0, 100, 100)])) return nil;
	_messageRect = CGRectInset(self.bounds, 10, 10);
	self.backgroundColor = [UIColor clearColor];
	return self;
	
}

- (void) drawRect:(CGRect)rect{
	[[UIColor colorWithWhite:0 alpha:0.8] set];
	[UIView drawRoundRectangleInRect:rect withRadius:10];
	[[UIColor whiteColor] set];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment =NSTextAlignmentCenter;
    [_text drawInRect:_messageRect
                  withAttributes:@{ NSFontAttributeName : [UIFont boldSystemFontOfSize:14],
                                    NSForegroundColorAttributeName : [UIColor whiteColor],
                                    NSParagraphStyleAttributeName : paragraphStyle }];
	CGRect r = CGRectZero;
	r.origin.y = 15;
	r.origin.x = (rect.size.width-_image.size.width)/2;
	r.size = _image.size;
	
	[_image drawInRect:r];
}

#pragma mark Setter Methods
- (void) adjust{
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]};
    CGSize s = [_text boundingRectWithSize:CGSizeMake(260, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
	
	float imageAdjustment = 0;
	if (_image) {
		imageAdjustment = 7+_image.size.height;
	}
	
	self.bounds = CGRectMake(0, 0, s.width+40, s.height+15+15+imageAdjustment);
	
	_messageRect.size = s;
	_messageRect.size.height += 5;
	_messageRect.origin.x = 20;
	_messageRect.origin.y = 15+imageAdjustment;
	
	[self setNeedsLayout];
	[self setNeedsDisplay];
	
}
- (void) setMessageText:(NSString*)str{
	_text = str;
	[self adjust];
}
- (void) setImage:(UIImage*)img{
	_image = img;
	[self adjust];
}

@end


#pragma mark -
@implementation TKAlertCenter

#pragma mark Init & Friends
+ (TKAlertCenter*) defaultCenter {
	static TKAlertCenter *defaultCenter = nil;
	if (!defaultCenter) {
		defaultCenter = [[TKAlertCenter alloc] init];
	}
	return defaultCenter;
}

-(void)dealloc
{
	_alerts = nil;
	_alertView = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id) init{
	if(!(self = [super init])) 
        return nil;
	
	_alerts = [[NSMutableArray alloc] init];
	_alertView = [[TKAlertView alloc] init];
	_active = NO;
	
	
	_alertFrame = [[UIScreen mainScreen] bounds];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardDidHideNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationWillChange:) name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];

	return self;
}


#pragma mark Show Alert Message
- (void) showAlerts{
	
	if([_alerts count] < 1) {
		_active = NO;
		return;
	}
	
	_active = YES;
	
	_alertView.transform = CGAffineTransformIdentity;
	_alertView.alpha = 0;
    
	[[UIApplication sharedApplication].keyWindow addSubview:_alertView];	
	
	NSArray *ar = [_alerts objectAtIndex:0];
	
	UIImage *img = nil;
	if([ar count] > 1){
        img = [[_alerts objectAtIndex:0] objectAtIndex:1];
        [_alertView setImage:img];
    }
	if([ar count] > 0) [_alertView setMessageText:[[_alerts objectAtIndex:0] objectAtIndex:0]];
		
	
	_alertView.center = CGPointMake(_alertFrame.origin.x+_alertFrame.size.width/2, _alertFrame.origin.y+_alertFrame.size.height/2);
		
	
	CGRect rr = _alertView.frame;
	rr.origin.x = (int)rr.origin.x;
	rr.origin.y = (int)rr.origin.y;
	_alertView.frame = rr;

//	UIInterfaceOrientation o = [UIApplication sharedApplication].statusBarOrientation;
//	CGFloat degrees = 0;
//	if(o == UIInterfaceOrientationLandscapeLeft ) degrees = -90;
//	else if(o == UIInterfaceOrientationLandscapeRight ) degrees = 90;
//	else if(o == UIInterfaceOrientationPortraitUpsideDown) degrees = 180;
//	_alertView.transform = CGAffineTransformMakeRotation(degrees * M_PI / 180);
//	_alertView.transform = CGAffineTransformScale(_alertView.transform, 2, 2);

	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.15];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationStep2)];

//	_alertView.transform = CGAffineTransformMakeRotation(degrees * M_PI / 180);
	_alertView.frame = CGRectMake((int)_alertView.frame.origin.x, (int)_alertView.frame.origin.y, _alertView.frame.size.width, _alertView.frame.size.height);
	_alertView.alpha = 1;
	
	[UIView commitAnimations];
	
	
}
- (void) animationStep2{
	[UIView beginAnimations:nil context:nil];

	// depending on how many words are in the text
	// change the animation duration accordingly
	// avg person reads 200 words per minute
//	NSArray * words = [[[_alerts objectAtIndex:0] objectAtIndex:0] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    

    NSString * word = @"";
    if ([_alerts count] > 0) {
        NSArray *arr = [_alerts objectAtIndex:0];
        if (arr && [arr count] > 0) {
            word = [[_alerts objectAtIndex:0] objectAtIndex:0];
        }
    }
    
    
    
    
	double duration = MAX(((double)word.length*6.0/60.0),2.0);
    

	[UIView setAnimationDelay:duration];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationStep3)];
	
//	UIInterfaceOrientation o = [UIApplication sharedApplication].statusBarOrientation;
//	CGFloat degrees = 0;
//	if(o == UIInterfaceOrientationLandscapeLeft ) degrees = -90;
//	else if(o == UIInterfaceOrientationLandscapeRight ) degrees = 90;
//	else if(o == UIInterfaceOrientationPortraitUpsideDown) degrees = 180;
//	_alertView.transform = CGAffineTransformMakeRotation(degrees * M_PI / 180);
//	_alertView.transform = CGAffineTransformScale(_alertView.transform, 0.5, 0.5);
	
	_alertView.alpha = 0;
	[UIView commitAnimations];
}
- (void) animationStep3{
	
	[_alertView removeFromSuperview];
	[_alerts removeAllObjects];
	_active = NO;
}
- (void) postAlertWithMessage:(NSString*)message image:(UIImage*)image{
	[_alerts addObject:[NSArray arrayWithObjects:message,image,nil]];
	if(!_active) [self showAlerts];
}
- (void) postAlertWithMessage:(NSString*)message{
	[self postAlertWithMessage:message image:nil];
    
}


#pragma mark System Observation Changes
CGRect subtractRect(CGRect wf,CGRect kf);
CGRect subtractRect(CGRect wf,CGRect kf){
	
	
	
	if(!CGPointEqualToPoint(CGPointZero,kf.origin)){
		
		if(kf.origin.x>0) kf.size.width = kf.origin.x;
		if(kf.origin.y>0) kf.size.height = kf.origin.y;
		kf.origin = CGPointZero;
		
	}else{
		
		
		kf.origin.x = fabs(kf.size.width - wf.size.width);
		kf.origin.y = fabs(kf.size.height -  wf.size.height);
		
		
		if(kf.origin.x > 0){
			CGFloat temp = kf.origin.x;
			kf.origin.x = kf.size.width;
			kf.size.width = temp;
		}else if(kf.origin.y > 0){
			CGFloat temp = kf.origin.y;
			kf.origin.y = kf.size.height;
			kf.size.height = temp;
		}
		
	}
	return CGRectIntersection(wf, kf);
	
	
	
}
- (void) keyboardWillAppear:(NSNotification *)notification {
	
	NSDictionary *userInfo = [notification userInfo];
	NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
	CGRect kf = [aValue CGRectValue];
	CGRect wf = [UIApplication sharedApplication].keyWindow.bounds;
	
	[UIView beginAnimations:nil context:nil];
	_alertFrame = subtractRect(wf,kf);
	_alertView.center = CGPointMake(_alertFrame.origin.x+_alertFrame.size.width/2, _alertFrame.origin.y+_alertFrame.size.height/2);

	[UIView commitAnimations];

}
- (void) keyboardWillDisappear:(NSNotification *) notification {
	_alertFrame = [UIApplication sharedApplication].keyWindow.bounds;

}
- (void) orientationWillChange:(NSNotification *) notification {
	
	NSDictionary *userInfo = [notification userInfo];
	NSNumber *v = [userInfo objectForKey:UIApplicationStatusBarOrientationUserInfoKey];
	UIInterfaceOrientation o = [v intValue];
	
	CGFloat degrees = 0;
	if(o == UIInterfaceOrientationLandscapeLeft ) degrees = -90;
	else if(o == UIInterfaceOrientationLandscapeRight ) degrees = 90;
	else if(o == UIInterfaceOrientationPortraitUpsideDown) degrees = 180;
	
	[UIView beginAnimations:nil context:nil];
	_alertView.transform = CGAffineTransformMakeRotation(degrees * M_PI / 180);
	_alertView.frame = CGRectMake((int)_alertView.frame.origin.x, (int)_alertView.frame.origin.y, (int)_alertView.frame.size.width, (int)_alertView.frame.size.height);
	[UIView commitAnimations];
	
}

@end