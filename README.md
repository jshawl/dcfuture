# DCFuture

Welcome to DCFuture.com, your on-ramp to local DC politics, issues and communities!

This project was completed with Ruby on Rails as part of General Assembly's Web Development Immersive course, but it was a couple years in the making. A friend of mine first suggested a user-generated blog about DC politics and issues, and I decided to partner with her on it. Within a few months, DCFuture.com was born, although we had a tough time figuring out how to produce a fully-functioning and integrated distributed blog platform. This rails app, deployed to Heroku at https://dcfutureblog.herokuapp.com/, fills in that missing piece.

It contains most aspects of standard user-generated blog functionality to which veteran bloggers will be accustomed. Anyone can:
* Create an Account
* Fill Out a Profile, including a place for a picture/icon
* Create a Blog Post - without knowing any HTML
* Comment on a Post
* Edit or delete anything you've created
* View all members, or only those who are DC voters
* View all posts, or filter by four pre-chosen issues
* Tag your post with one of dozens of pre-loaded tags, or create your own
* Choose interests (created as tags) within your profile, and view the interests of others
* View all existing tags
* Click on a particular tag to view all users with that interest and posts with that tag
* You do not have to log in to view posts or users, but editing or creating anything requires login.

Most features of the site beyond rails, including user authentication and CSS design, are "handrolled" from scratch. Passwords are encrypted using the "bcrypt" gem. The one major exception is a complex gem called "ckeditor", which transforms an ordinary text box into a beautiful WYSIWYG (what you see is what you get) box akin to Wordpress or most contemporary word processors. It can also handle uploaded files through an associated "paperclip" gem.

**Remaining unsolved problems**
* It would be great to include more interactive social function on the site, particularly an uprating system, an easy share capability via Facebook and Twitter, and the ability to sort posts by popularity.
* An easier interface for uploading profile pictures as well as including images and videos in a post.
* More mobile-friendly design. The CSS was recently reworked to be more responsive, but is still not fully responsive in smaller windows and on phones.
* Integration with rest of DCFuture.com site is perfunctory and still needs a great deal of further consideration. This will be a major change for the next iteration of this project.
* Some customization of ckeditor features would also be desirable, as the default settings are not ideal (eg difficult to center ckeditor-produced text).
