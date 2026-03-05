#import <Foundation/Foundation.h>

// Hook NSURL to intercept Twitch HLS requests
%hook NSURL

+ (instancetype)URLWithString:(NSString *)URLString {
    // Check for Twitch usher stream URL
    if ([URLString containsString:@"usher.ttvnw.net/api/channel/hls/"]) {
        // Parse channel name from URL
        NSURL *tempURL = [NSURL URLWithString:URLString];
        NSString *channel = [tempURL.lastPathComponent stringByDeletingPathExtension];
        
        // Construct Luminous proxy URL
        NSString *proxyURL = [NSString stringWithFormat:@"https://eu.luminous.dev/live/%@?allow_source=true&allow_audio_only=true&fast_bread=true", channel];
        return %orig(proxyURL);
    }
    
    // Return original URL
    return %orig(URLString);
}

%end
