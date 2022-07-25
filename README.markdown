# Quick Tour Of This App:

## UserImage

The main model at work here is UserImage.  This model has a paperclip attachment; the image file which we want to protect.

Using the usual Rails scaffold you can CRUD user images as you please.

NOTE: in views/user\_images/\_form.html\_erb we have to set {:html => {:multipart => true}}

Once an image is uploaded, it's stored in Rails.root/user_images. This directory is *not* accessible to the public.

## Paperclip Settings

Paperclip is configured (see UserImage.rb) to store the images here but refer to them as though they are stored in public/images.
This means when we call 
<pre>
<code>
  @user_image.image.path # => /var/www/my_app/user_images/id/filename.format
  @user_image.image.url  # => /public/images/filename.format
</code>
</pre>

Now we need to set up routes and a controller to catch this!

## Routing
If you check the routing you'll see that I've defined a route specifically for images.
Any request made to /images/myfile.jpg will be sent to the images controller with params = {:name => "myfile", :format => "jpg"}

## ImagesController

This controller deals with sending the image. The first thing you should notice is the before_filter. Set this to call whatever method you want to use to authenticate your users and ensure they have access to this image. From then, we can find the image using the parameters provided and send it to the browser.


## send_file
In the images controller we can then use [send_file](http://api.rubyonrails.org/classes/ActionController/Streaming.html#method-i-send_file) to send the file inline.
