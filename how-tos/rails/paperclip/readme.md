# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Image Uploading on Rails

## Paperclip & AWS S3

1. Install imagemagick

```git
$brew install imagemagick
```

2. Add Paperclip to your Gemfile

```git
gem "paperclip", "~> 4.3"
```

3. Add paperclip code your User model

```rb
class User < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..10.kilobytes }
end
```
the ':styles' attribute creates various styles of image that are accessible with these helpers:

```rb
  <%= image_tag @user.avatar.url %>
  <%= image_tag @user.avatar.url(:medium) %>
  <%= image_tag @user.avatar.url(:thumb) %>
```

4. Create a migration $ rails generate paperclip user avatar

```rb
class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :avatar
  end

  def down
    remove_attachment :users, :avatar
  end
end
```

5. Add a file to your users#forms

```rb
<%= form_for @user, :url => users_path, :html => { :multipart => true } do |form| %>
  <%= form.file_field :avatar %>
<% end %>
```

**Remember to add :avatar to user_params**

6. Let's add some validations:

```rb
  validates_attachment :avatar, :presence => true,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..10.kilobytes }
```

7. This should work to save images now locally, but it won't work in heroku. In order to save images in heroku you'll need to setup an S3 bucket.

8. Sign into an Amazon Web Services (AWS) account and select S3. Create a new bucket. Get your API keys.

9. Add the dotenv gem to your Gemfile and add a .env file to the root of your project. Now add your AWS_BUCKET, AWS_PUBLIC_KEY, and AWS_SECRET to the .env file.

```rb
  S3_BUCKET=buckity-bucket
  S3_PUBLIC_KEY=kafjlajdslfjalsdf
  S3_SECRET=ajsfkljaksldfjakljdflajdfljad
```
**Remember to add your .env file to your .gitignore!**

10. Add the aws-sdk gem and path in paperclip

```rb
gem 'aws-sdk', '~> 1.6'
```

```rb
has_attached_file :avatar,
                  :styles => { :medium => "150x150>", :thumb => "44x44#>" },
                  :storage => :s3,
                  :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                  :path => "avatars/:id/:style/avatar.:extension",
                  :default_url => "https://s3.amazonaws.com/<<BUCKET>>/defaults/default_avatar.png"

def s3_credentials
  { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
end
```

Now it should work! Upload a file to see.

### Troubleshooting

Image still not loading? Here are some things to check:

*  Is your image uploading? Check in the bucket
*  Are you getting an "Access Denied" error? Check that your AWS credentials are right in you .env file.
*  Are you getting other bogus stuff!?