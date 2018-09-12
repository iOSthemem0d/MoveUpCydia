#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

@interface CydiaTabBarController : UITabBarController
@end

%hook UITabBarButton

-(id)initWithImage:(id)arg1 landscapeImage:(id)arg2 selectedImage:(id)arg3 landscapeSelectedImage:(id)arg4 label:(id)arg5 withInsets:(UIEdgeInsets)arg6 landscapeInsets:(UIEdgeInsets)arg7 tabBar:(id)arg8{
    arg6 = UIEdgeInsetsMake(-15,0,15,0);
    return %orig;
  }
%end

%hook UITabBar

-(CGSize)sizeThatFits:(CGSize)arg1{
return CGSizeMake (SCREEN_WIDTH, 80);
}

-(CGRect)frame {
    return CGRectMake (0,753,SCREEN_WIDTH,80);
}

%end

%hook UITabBarController

-(void)viewDidLoad{
  %orig;
  [UITabBarItem appearance].titlePositionAdjustment = UIOffsetMake(0, -29);
}
%end
