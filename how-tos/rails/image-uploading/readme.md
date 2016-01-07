# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Image Uploading with Paperclip & AWS S3

1. Install imagemagick.

  ```zsh
  ➜  brew install imagemagick
  ```

2. Add Paperclip to your `Gemfile`.

  ```ruby
  gem "paperclip", "~> 4.3"
  ```

3. Add the paperclip code your `User` model.

  ```ruby
  class User < ActiveRecord::Base
    has_attached_file :avatar,
                      :styles => { :medium => "150x150>", :thumb => "44x44#" },
                      :default_url => "/images/:style/missing.png"

    validates_attachment :avatar, :presence => true,
                         :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                         :size => { :in => 0..10.kilobytes }
  end
  ```

The `:styles` attribute creates various styles of images that are accessible with these helpers:

  ```html
  <%= image_tag @user.avatar.url %>
  <%= image_tag @user.avatar.url(:medium) %>
  <%= image_tag @user.avatar.url(:thumb) %>
  ```

4. Create a migration: `➜  rails generate paperclip user avatar`.

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

5. Add a file to your `users#form`.

  ```html
  <%= form_for @user, :url => users_path, :html => { :multipart => true } do |form| %>
    <%= form.file_field :avatar %>
  <% end %>
  ```

  **Remember to add :avatar to user_params in the UsersController.**

6. Let's add some validations:

  ```ruby
  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..10.kilobytes }
  ```

7. This should now work to save images locally, but it won't work on Heroku. In order to save images on Heroku, you'll need to setup an S3 bucket.

8. Sign into your Amazon Web Services (AWS) account, and select S3. Create a new bucket. Get your API keys.

9. Add the `dotenv-rails` gem to your `Gemfile`, and add a `.env` file to the root of your project. Now add your AWS_BUCKET, AWS_PUBLIC_KEY, and AWS_SECRET to the `.env` file.

  ```
  S3_BUCKET=buckity-bucket
  S3_PUBLIC_KEY=kafjlajdslfjalsdf
  S3_SECRET=ajsfkljaksldfjakljdflajdfljad
  ```

**Remember to add your .env file to your .gitignore!**

10. Add the `aws-sdk` gem to your `Gemfile`, and add the path to your Paperclip setup.

  ```ruby
  gem 'aws-sdk', '~> 1.6'
  ```

  ```ruby
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

## Troubleshooting

Image still not loading? Here are some things to check:

*  Is your image uploading? Check in the S3 bucket.
*  Are you getting an "Access Denied" error? Check that your AWS credentials are correct in your `.env` file.

## Resources

Use these docs as guides when you're implementing Paperclip and S3 in your Rails app.

* <a href="https://github.com/thoughtbot/paperclip" target="_blank">Paperclip Docs</a>
* <a href="https://devcenter.heroku.com/articles/paperclip-s3" target="_blank">Paperclip & S3 - Heroku Dev Center</a>
