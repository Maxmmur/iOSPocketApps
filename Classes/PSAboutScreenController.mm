//
//  PSAboutScreenController.mm
//  PocketSword
//
//  Created by Nic Carter on 12/11/09.
//  Copyright 2009 The CrossWire Bible Society. All rights reserved.
//

#include <sys/types.h>
#include <sys/sysctl.h>

#import "PSAboutScreenController.h"
#import "PSModuleController.h"
#import "globals.h"

@implementation PSAboutScreenController

@synthesize aboutWebView;

+ (NSString*)generateAboutHTML
{
	static NSString *body = [NSString stringWithFormat:
							 @"<div id=\"header\">\n\
								 <div class=\"title\">GoldenBowl</div>\n\
								 <div class=\"version\"> Version %@ (%@)</div>\n\
								 <center><i>Visit Us: <a href=\"https://www.gadsda.com\">Gadsda.Com</a></i><br />\n\
									<i>Email Us: <a href=\"mailto:info@gadsda.com\">info@gadsda.com</a></i><br />\n\
									<i>Call Us: <a href=\"tel:254-855-9539\">+1-254-855-9539</a></i></center>\n\
							 </div>\n\
							 <div id=\"main\">\n\
								<p><b>Home Office Address: </b><br />\n\
									 The Davidian Seventh-Day Adventists Association <br />\n\
									 P.O. Box 23738, Waco, TX 76702\n\
								</p>\n\
								 \n\
							</div>\n\
								<p>If you would like to read GoldenBowl on another platform, check out the following links:<br />\n\
										&bull; <b><a href=\"http://itunes.apple.com/us/author/victor-t-houteff/id1205313025?mt=11/\">Apple iBooks</a></b><br />\n\
										&bull; <b><a href=\"http://www.amazon.com/Victor-T.-Houteff/e/B06W568YCW/\">Amazon Kindle</a></b><br />\n\
										&bull; <b><a href=\"https://www.gadsda.com/download-the-shepherds-rod-epub/\">EPUB Format</a></b><br />\n\
										&bull; <b><a href=\"https://www.gadsda.com/download-the-shepherds-rod-mobi/\">MOBI Format</a></b><br />\n\
									</p>\n\
								<p>If you would like to see GoldenBowl in your language and are willing to help translate it, please email us by tapping on the Feedback button in the top right corner; we would love your help!</p>\
					  \
					  \n\
					  \n\
					  <p>Useful Links:<br />\n\
					  &bull; <b><a href=\"http://gadsda.com/storehouse\">Order Shepherd's Rod Literature</a></b><br />\n\
					  &bull; <b><a href=\"https://gadsda.webex.com/\">Gadsda WebEx Event Center</a></b><br />\n\
					  &bull; <b><a href=\"http://www.youtube.com/user/TrueDavidian?sub_confirmation=1\">YouTube Channel</a></b><br />\n\
					  &bull; <b><a href=\"https://soundcloud.com/wavesheaf\">SoundCloud Station</a></b><br />\n\
					  &bull; <b><a href=\"https://www.gadsda.com/tithe/\">Tithes and Offerings</a></b><br />\n\
                             </p>\
					  <br />\n\
					  <br />\n\
					  <div class=\"crosswire\">\n\
					  <h2 class=\"headbar\">The Davidian Seventh-day Adventists Association</h2>\n\
					  <p> &nbsp; &nbsp; &nbsp;Provisional in set-up as well as in name, the Davidian Seventh-day Adventist Association exists solely to accomplish a divinely appointed work within the Seventh-day Adventist denomination, wherein it therefore strictly confines its activities.  As its work therewithin draws to a close, and the \"servants of our God\" (Rev. 7:3) are sealed, its name will be changed (Isa. 56:5; 62:2; 65:15) and its purpose and its work will become all-embracing to the gospel (Matt. 17:11; Acts 3:21, Isa. 61:4-7).  Then its Constitution and By-Laws as <a href=\"https://www.gadsda.com/the-leviticus/\">herein</a> codified will become fully operative.</p>\n\
\n\
					  <p> &nbsp; &nbsp; &nbsp;The name, Davidian, deriving from the name of the king of Ancient Israel, accrues to this Association by reason of its following aspects: First, it is dedicated to the work of announcing and bringing forth the restoration (as predicted in Hosea 1:11; 3:5) of David's kingdom in antitype, upon the throne of which Christ, \"the son of David,\" is to sit. Second, it purports itself to be the first of the first fruits of the living, the vanguard from among the present-day descendants of those Jews who composed the Early Christian Church. With the emergence of this vanguard and its army, the first fruits, from which are elected the 12,000 out of each of the twelve tribes of Jacob, \"the 144,000\" (Rev. 14:1; 7:2-8) who stand on Mount Zion with the Lamb (Rev. 14:1; 7:2-8), the reign of antitypical David begins.</p>\n\
\n\
					  <p> &nbsp; &nbsp; &nbsp;The name Seventh-day Adventist, which this Association inherits from the parent denomination, is provisional (Isa. 62:2) and only for the duration of its work within the parent denomination.<br /> </p>\n\
					  </div>\n\
					  <div class=\"crosswire\">\n\
					  <h2 class=\"headbar\">Our Object: </h2>\n\
					  The <strong>object of this Association is to bring about among God's people that reformation called for in the <i>Testimonies for the Church</i>, Volume 9, page 126,</strong> as the prerequisite movement to sounding the “Eleventh-Hour Call” (Matt. 20:6, 7) of “the everlasting gospel...to every nation, and kindred, and tongue, and people.” Rev. 14:6.\n\
					  </div>\n\
					  <br />&nbsp;<br />",
							 [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],
							 [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"],
							 [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OFL" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil]
							 ];
	
	
	return [NSString stringWithFormat: @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\
			<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\n\
			\"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\n\
			<html dir=\"ltr\" xmlns=\"http://www.w3.org/1999/xhtml\"\n\
			xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n\
			xsi:schemaLocation=\"http://www.w3.org/MarkUp/SCHEMA/xhtml11.xsd\"\n\
			xml:lang=\"en\" >\n\
			<meta name='viewport' content='width=device-width' />\n\
			<head>\n\
			<style type=\"text/css\">\n\
			html {\n\
				-webkit-text-size-adjust: none; /* Never autoresize text */\n\
			}\n\
			body {\n\
				color: black;\n\
				background-color: white;\n\
				font-size: 11pt;\n\
				font-family: %@;\n\
				line-height: 130%%;\n\
			}\n\
			#header {\n\
				font-weight: bold;\n\
				border-bottom: solid 1px gray;\n\
				padding: 5px;\n\
				background-color: #D5EEF9;\n\
			}\n\
			#main {\n\
				padding: 10px;\n\
				text-align: center;\n\
			}\n\
			div.version {\n\
				font-size: 9pt;\n\
				text-align: center;\n\
			}\n\
			div.title {\n\
				font-size: 14pt;\n\
				text-align: center;\n\
			}\n\
			i {\n\
				font-size: 9pt;\n\
				font-weight: lighter;\n\
			}\n\
			div.crosswire {\n\
				font-size: 9pt;\n\
			}\n\
			h2.headbar {\n\
				background-color : #660000;\n\
				color : #dddddd;\n\
				font-weight : bold;\n\
				font-size:1em;\n\
				padding-left:1em;\n\
			}\n\
			</style>\n\
			</head>\n\
			<body><div>%@</div></body></html>", PSDefaultFontName,
			body];
}

- (void)loadView {
	CGFloat viewWidth = [[UIScreen mainScreen] bounds].size.width;
	CGFloat viewHeight = [[UIScreen mainScreen] bounds].size.height;
	
	UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
	
	UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
	wv.delegate = self;
	wv.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	wv.backgroundColor = [UIColor whiteColor];
	wv.dataDetectorTypes = UIDataDetectorTypeAll & !UIDataDetectorTypePhoneNumber;
	NSString *html = @"<html><body bgcolor=\"white\">@nbsp;</body></html>";
	if([[NSUserDefaults standardUserDefaults] boolForKey:DefaultsNightModePreference]) {
		html = @"<html><body bgcolor=\"black\">@nbsp;</body></html>";
		wv.backgroundColor = [UIColor blackColor];
	}
	[wv loadHTMLString: html baseURL: nil];
	[baseView addSubview:wv];
	self.aboutWebView = wv;
	
	self.view = baseView;
}

- (void)viewDidLoad {
	self.navigationItem.title = NSLocalizedString(@"AboutTitle", @"About");
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
	
	UIBarButtonItem *emailUsBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"EmailUsButton", @"Feedback") style:UIBarButtonItemStylePlain target:self action:@selector(emailFeedback:)];
	self.navigationItem.rightBarButtonItem = emailUsBarButtonItem;

	[aboutWebView loadHTMLString:[PSAboutScreenController generateAboutHTML] baseURL:nil];
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (NSString *) platform {
	int mib[2];
	size_t len;
	char *machine;
	
	mib[0] = CTL_HW;
	mib[1] = HW_MACHINE;
	sysctl(mib, 2, NULL, &len, NULL, 0);
	machine = (char *)malloc(len);
	sysctl(mib, 2, machine, &len, NULL, 0);
	
	NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
	free(machine);
	return platform;
}

// thanks to erica https://github.com/erica/uidevice-extension
// Updates from http://theiphonewiki.com/wiki/Models
#define IFPGA_NAMESTRING                @"iFPGA"

#define IPHONE_1G_NAMESTRING            @"iPhone 1G"
#define IPHONE_3G_NAMESTRING            @"iPhone 3G"
#define IPHONE_3GS_NAMESTRING           @"iPhone 3GS"
#define IPHONE_4_NAMESTRING             @"iPhone 4"
#define IPHONE_4S_NAMESTRING            @"iPhone 4S"
#define IPHONE_5_NAMESTRING             @"iPhone 5"
#define IPHONE_5C_NAMESTRING            @"iPhone 5c"
#define IPHONE_5S_NAMESTRING            @"iPhone 5s"
#define IPHONE_6_NAMESTRING             @"iPhone 6"
#define IPHONE_6P_NAMESTRING            @"iPhone 6 Plus"
#define IPHONE_6S_NAMESTRING            @"iPhone 6s"
#define IPHONE_6SP_NAMESTRING           @"iPhone 6s Plus"
#define IPHONE_SE_NAMESTRING            @"iPhone SE"
#define IPHONE_7_NAMESTRING             @"iPhone 7"
#define IPHONE_7P_NAMESTRING            @"iPhone 7 Plus"
//#define IPHONE_UNKNOWN_NAMESTRING       @"Unknown iPhone"

#define IPOD_1G_NAMESTRING              @"iPod touch 1G"
#define IPOD_2G_NAMESTRING              @"iPod touch 2G"
#define IPOD_3G_NAMESTRING              @"iPod touch 3G"
#define IPOD_4G_NAMESTRING              @"iPod touch 4G"
#define IPOD_5G_NAMESTRING              @"iPod touch 5G"
#define IPOD_6G_NAMESTRING              @"iPod touch 6G"
//#define IPOD_UNKNOWN_NAMESTRING         @"Unknown iPod"

#define IPAD_1G_NAMESTRING              @"iPad 1G"
#define IPAD_2G_NAMESTRING              @"iPad 2G"
#define IPAD_3G_NAMESTRING              @"iPad 3G"
#define IPAD_4G_NAMESTRING              @"iPad 4G"
#define IPAD_AIR_1G_NAMESTRING			@"iPad Air 1G"
#define IPAD_AIR_2G_NAMESTRING			@"iPad Air 2G"
//#define IPAD_UNKNOWN_NAMESTRING         @"Unknown iPad"
#define IPAD_PRO_13_1G_NAMESTRING		@"iPad Pro (12.9-inch) 1G"
#define IPAD_PRO_10_1G_NAMESTRING		@"iPad Pro (9.7-inch) 1G"
#define IPAD_5G_NAMESTRING              @"iPad 5G"


#define IPAD_MINI_1G_NAMESTRING			@"iPad mini 1G"
#define IPAD_MINI_2G_NAMESTRING			@"iPad mini 2G"
#define IPAD_MINI_3G_NAMESTRING			@"iPad mini 3G"
#define IPAD_MINI_4G_NAMESTRING			@"iPad mini 4G"

//#define APPLETV_2G_NAMESTRING           @"Apple TV 2G"
//#define APPLETV_3G_NAMESTRING           @"Apple TV 3G"
//#define APPLETV_4G_NAMESTRING           @"Apple TV 4G"
//#define APPLETV_UNKNOWN_NAMESTRING      @"Unknown Apple TV"

//#define IOS_FAMILY_UNKNOWN_DEVICE       @"Unknown iOS device"

#define SIMULATOR_NAMESTRING            @"iPhone Simulator"
#define SIMULATOR_IPHONE_NAMESTRING     @"iPhone Simulator"
#define SIMULATOR_IPAD_NAMESTRING       @"iPad Simulator"
#define SIMULATOR_APPLETV_NAMESTRING    @"Apple TV Simulator" // :)

- (NSString *) platformString
{
    NSString *platform = [self platform];
	
    // The ever mysterious iFPGA
    if ([platform isEqualToString:@"iFPGA"])        return IFPGA_NAMESTRING;
	
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return IPHONE_1G_NAMESTRING;
    if ([platform isEqualToString:@"iPhone1,2"])    return IPHONE_3G_NAMESTRING;
    if ([platform hasPrefix:@"iPhone2"])            return IPHONE_3GS_NAMESTRING;
    if ([platform hasPrefix:@"iPhone3"])            return IPHONE_4_NAMESTRING;
    if ([platform hasPrefix:@"iPhone4"])            return IPHONE_4S_NAMESTRING;
    if ([platform hasPrefix:@"iPhone5,1"])            return IPHONE_5_NAMESTRING;
    if ([platform hasPrefix:@"iPhone5,2"])            return IPHONE_5_NAMESTRING;
    if ([platform hasPrefix:@"iPhone5,3"])            return IPHONE_5C_NAMESTRING;
    if ([platform hasPrefix:@"iPhone5,4"])            return IPHONE_5C_NAMESTRING;
    if ([platform hasPrefix:@"iPhone6,1"])            return IPHONE_5S_NAMESTRING;
    if ([platform hasPrefix:@"iPhone6,2"])            return IPHONE_5S_NAMESTRING;
	if ([platform hasPrefix:@"iPhone7,2"])            return IPHONE_6_NAMESTRING;
	if ([platform hasPrefix:@"iPhone7,1"])            return IPHONE_6P_NAMESTRING;
	if ([platform hasPrefix:@"iPhone8,1"])            return IPHONE_6S_NAMESTRING;
	if ([platform hasPrefix:@"iPhone8,2"])            return IPHONE_6SP_NAMESTRING;
	if ([platform hasPrefix:@"iPhone8,4"])            return IPHONE_SE_NAMESTRING;
	if ([platform hasPrefix:@"iPhone9,1"] ||
		[platform hasPrefix:@"iPhone9,3"])            return IPHONE_7_NAMESTRING;
	if ([platform hasPrefix:@"iPhone9,2"] ||
		[platform hasPrefix:@"iPhone9,4"])            return IPHONE_7P_NAMESTRING;
	
    // iPod
    if ([platform hasPrefix:@"iPod1"])              return IPOD_1G_NAMESTRING;
    if ([platform hasPrefix:@"iPod2"])              return IPOD_2G_NAMESTRING;
    if ([platform hasPrefix:@"iPod3"])              return IPOD_3G_NAMESTRING;
    if ([platform hasPrefix:@"iPod4"])              return IPOD_4G_NAMESTRING;
	if ([platform hasPrefix:@"iPod5"])              return IPOD_5G_NAMESTRING;
	if ([platform hasPrefix:@"iPod7"])              return IPOD_6G_NAMESTRING;
	
    // iPad
    if ([platform hasPrefix:@"iPad1"])              return IPAD_1G_NAMESTRING;
		// mini
    if ([platform hasPrefix:@"iPad2,5"] ||
		[platform hasPrefix:@"iPad2,6"] ||
		[platform hasPrefix:@"iPad2,7"])            return IPAD_MINI_1G_NAMESTRING;
	if ([platform hasPrefix:@"iPad4,4"] ||
		[platform hasPrefix:@"iPad4,5"] ||
		[platform hasPrefix:@"iPad4,6"])            return IPAD_MINI_2G_NAMESTRING;
	if ([platform hasPrefix:@"iPad4,7"] ||
		[platform hasPrefix:@"iPad4,8"] ||
		[platform hasPrefix:@"iPad4,9"])            return IPAD_MINI_3G_NAMESTRING;
	if ([platform hasPrefix:@"iPad5,1"] ||
		[platform hasPrefix:@"iPad5,2"])            return IPAD_MINI_4G_NAMESTRING;
	// iPad
    if ([platform hasPrefix:@"iPad2"])              return IPAD_2G_NAMESTRING;
    if ([platform hasPrefix:@"iPad3,4"] ||
		[platform hasPrefix:@"iPad3,5"] ||
		[platform hasPrefix:@"iPad3,6"])            return IPAD_4G_NAMESTRING;
    if ([platform hasPrefix:@"iPad3"])              return IPAD_3G_NAMESTRING;
	if ([platform hasPrefix:@"iPad4"])				return IPAD_AIR_1G_NAMESTRING;
	if ([platform hasPrefix:@"iPad5"])				return IPAD_AIR_2G_NAMESTRING;
	if ([platform hasPrefix:@"iPad6,7"] ||
		[platform hasPrefix:@"iPad6,8"])            return IPAD_PRO_13_1G_NAMESTRING;
	if ([platform hasPrefix:@"iPad6,3"] ||
		[platform hasPrefix:@"iPad6,4"])            return IPAD_PRO_10_1G_NAMESTRING;
	if ([platform hasPrefix:@"iPad6,11"] ||
		[platform hasPrefix:@"iPad6,12"])           return IPAD_5G_NAMESTRING;
	
    
    // Simulator thanks Jordan Breeding
    if ([platform hasSuffix:@"86"] || [platform isEqual:@"x86_64"])
    {
        BOOL smallerScreen = [[UIScreen mainScreen] bounds].size.width < 768;
        return smallerScreen ? SIMULATOR_IPHONE_NAMESTRING : SIMULATOR_IPAD_NAMESTRING;
    }
	
    return platform;
}


-(void)emailFeedback:(id)sender
{
    NSString *recipients = @"publishing@gadsda.com";//@"pocketsword-support@crosswire.org";//
	
	NSString *subject = [NSString stringWithFormat:@"GoldenBowl Feedback (v%@ - %@ %@ (%@))", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion], [self platformString]];
	
	if([MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
		[mailComposeViewController setSubject:subject];
		[mailComposeViewController setToRecipients:[NSArray arrayWithObject:recipients]];
		mailComposeViewController.mailComposeDelegate = self;
		mailComposeViewController.navigationBar.barStyle = UIBarStyleBlack;
		[self.tabBarController presentModalViewController:mailComposeViewController animated:YES];
	}
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self.tabBarController dismissModalViewControllerAnimated:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	if(navigationType == UIWebViewNavigationTypeLinkClicked) {
		[[UIApplication sharedApplication] openURL:[request URL]];
		return NO;
	}
	return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	[super viewDidUnload];
}



@end
