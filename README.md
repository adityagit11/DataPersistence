#  Data Persistence in iOS

This project is looking for ways to store the state of the app even after the process which created it gets completed. This will be served as a static library available for apps to store their state in a data storage.
Ways in which we can store the app state:

## User Defaults
You can store following classes using UserDefaults
> NSData
> NSString
> NSNumber
> NSData
> NSArray
> NSDictionary

* NSArray or NSDictionary can only be saved in the UserDefaults if they are any of the mentioned types above NSArray

Where does the UserDefaults store the data?
Inside an internal plist which is maintained by the OS for each application.

Limitation of UserDefaults?
The maximum data we can store in UserDefaults is about X GB where X could be between [4, 5) depending upon the OS you are working with. This maximum limit is due to the internal plist file size on the iOS platform.
The plist file is read in and written out as an entire file, even for a small change you would be spending cycles on I/O for entire file. Best suited for small changes only.

Code -> UserDefaultUtil.swift

