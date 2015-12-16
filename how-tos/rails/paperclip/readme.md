How to Upload an Image on Rails

## Paperclip & AWS S3

Install imagemagick

$brew install imagemagick
Add Paperclip to your Gemfile

gem "paperclip", "~> 4.3"
Add paperclip code your User model

class User < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..10.kilobytes }
end
the :styles attribute creates various styles of image that are accessible with these helpers:

  <%= image_tag @user.avatar.url %>
  <%= image_tag @user.avatar.url(:medium) %>
  <%= image_tag @user.avatar.url(:thumb) %>
Create a migration $ rails generate paperclip user avatar

class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :avatar
  end

  def down
    remove_attachment :users, :avatar
  end
end
Add a file to your users#forms

<%= form_for @user, :url => users_path, :html => { :multipart => true } do |form| %>
  <%= form.file_field :avatar %>
<% end %>
Remember to add :avatar to user_params

Let's add some validations:

  validates_attachment :avatar, :presence => true,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..10.kilobytes }
This should work to save images now locally, but it won't work in heroku. In order to save images in heroku you'll need to setup an S3 bucket.

Sign into an Amazon Web Services (AWS) account and select S3. Create a new bucket. Get your API keys.

Add the dotenv gem to your Gemfile and add a .env file to the root of your project. Now add your AWS_BUCKET, AWS_PUBLIC_KEY, and AWS_SECRET to the .env file.

  S3_BUCKET=buckity-bucket
  S3_PUBLIC_KEY=kafjlajdslfjalsdf
  S3_SECRET=ajsfkljaksldfjakljdflajdfljad
Remember to add your .env file to your .gitignore!
Add the aws-sdk gem and path in paperclip

gem 'aws-sdk', '~> 1.6'
has_attached_file :avatar,
                  :styles => { :medium => "150x150>", :thumb => "44x44#>" },
                  :storage => :s3,
                  :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                  :path => "avatars/:id/:style/avatar.:extension",
                  :default_url => "https://s3.amazonaws.com/<<BUCKET>>/defaults/default_avatar.png"

def s3_credentials
  { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
end
Now it should work! Upload a file to see.
Troubleshooting

Image still not loading? Here are some things to check:

Is your image uploading? Check in the bucket
Are you getting an "Access Denied" error? Check that your AWS credentials are right in you .env file.
Are you getting other bogus stuff!?
