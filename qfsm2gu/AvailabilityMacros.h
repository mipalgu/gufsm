#import <Foundation/Foundation.h>
#ifdef GNUSTEP_BASE_VERSION
typedef unichar	UniChar;
typedef NSMutableString *CFMutableStringRef;
#define	CFStringGetCharactersPtr(s)	NULL
#define	CFStringAppendCharacters(s,b,n)	[(s) appendString: [NSString stringWithCharacters: (b) length: (n)]]
#endif
