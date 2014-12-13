//
//  UIImageViewAnimator.h
//  UIImageViewAnimatorSample
//

#import <UIKit/UIKit.h>

@class UIAnimationImageView;

typedef void(^AnimationViewCallBack)(UIAnimationImageView*);

@interface UIAnimationImageView : UIImageView
{
    
@private
	NSTimer *				animtimer;
	NSArray *				imageNames;
	NSInteger				index;
	NSTimeInterval			duration;
	
	
	Boolean					cacheImages;
	Boolean					reverse;
	Boolean					imageset;
}

@property (nonatomic)			NSInteger		index;
@property (nonatomic,readonly)	NSInteger		count;
@property (nonatomic,copy)		NSArray *		imageNames;
@property (nonatomic)			NSTimeInterval	duration;
@property (nonatomic)			Boolean			cacheImages;
@property (nonatomic)			Boolean			reverse;

@property (nonatomic, copy) AnimationViewCallBack startCallBack;
@property (nonatomic, copy) AnimationViewCallBack finishCallBack;
@property (nonatomic, copy) AnimationViewCallBack frameChangeCallBack;

- (void) startAnimatingWithFinsh:(AnimationViewCallBack)finish
                   FrameCallBack:(AnimationViewCallBack)frame
                   StartCallBack:(AnimationViewCallBack)start;

- (void) stopAnimating;
- (Boolean) isAnimating;

- (void) precache;

@end
