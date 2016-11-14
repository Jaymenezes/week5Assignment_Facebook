## Facebook

The purpose of this homework is to leverage animations and gestures to transition between screens. We're going to use the techniques from this week to implement some interactions in Facebook.

Time spent: `<Number of hours spent>`

### Features

#### Required

- [x] Tapping on a photo in the news feed should expand the photo full screen.
- [x] Tapping the Done button should animate the photo back into its position in the news feed.
- [x] On scroll of the full screen photo, the background should start to become transparent, revealing the feed.
- [x] If the user scrolls a large amount and releases, the full screen photo should dismiss.

#### Optional

- [x] The full screen photo should be zoomable.
- [x] The user should be able to page through the other photos in full screen mode.

#### The following **additional** features are implemented:

- [x] Used convertValue method to fadeOut the doneButton and actionButton based on scrollOffset.
- [x] When the zoomScale is bigger than 1.5, the screen animates to full size of the view.


Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Couldn't get the movingIMage View to respect the contentMode of the tappedImageView. It would not transition from aspectFill to aspectFit on click. 
2. Major bugs with zooming.
3. Couldn't get the contentOffset of the scrollView to work correctly on the performSegue method.

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='week5_facebook_ImageScroll.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

* Any libraries or borrowed content.
