## What is this?

[**Jila**](http://jilaframework.github.io) is a framework for building simple language learning apps. This particular repository is for the administrative backend and the API used to communicate with the app.

The **Jila** administration console is built using [Ruby on Rails](http://rubyonrails.org/) and the [ActiveAdmin](http://activeadmin.info/) framework.

## Prerequisites

- Ruby

## Installation

Install Ruby gems
`bundle install`

## Getting Started

### Development
Launch a Rails server however you wish, see their [documentation](http://guides.rubyonrails.org/getting_started.html) if you have any particular questions. The simplest way to launch it would be to run `bundle exec rails s` which will launch a server at 'http://localhost:3000'.

## Deployment
The backend is a fairly vanilla Ruby on Rails application, so hosting arrangements can be whatever suits the user. The team have been using [Heroku](http://www.heroku.com) for both development/testing and production environments. Asset storage (images and audio) is configured to use [Amazon Simple Storage Service (S3)](http://aws.amazon.com/s3/) for production-like environments, and the local file system for development.

The production environment uses [Paperclip](https://github.com/thoughtbot/paperclip) to upload the assets to S3. For each deployment environment you will have to set environment variables for the S3 bucket name, and the credentials, as outlined in **production.rb**.

## Customisation
The administration console is usable out of the box with no changes. If you do make changes, **please consider submitting a pull request so the community can benefit**.

--

## Dan's notes

### In setting this up I am going to (for now) make a running list of what worked and what didn't.

- Amazon Regions generate s3 urls differently. So assuming you have got your bucket set up and ready
to receive your image assets, you may run into the problem of ActiveAdmin not being able to display
your image thumbnails. Since this particular setup is located in the Pacific North West region of
the united states, I opted for the uswest-2 region, which is located in Oregon. The problem is that
us-west-2 wants s3 urls to look like this:  

``http://<bucket-name>.s3-us-west-2.amazonaws.com/entries/images/000/000/005/thumbnail/<image file name>``

Whereas the region that would be used in Australia (s3-ap-southeast-2) wants them to look like this:

``http://s3-ap-southeast-2.amazonaws.com/<bucket-name>/entries/images/000/000/005/thumbnail/<image file name>``

Which also happens to be the default way urls are generated by paperclip, the image handler. To fix this, I added the following to ``/config/initializers/paperclip.rb`:
``Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = ":class/:attachment/:id_partition/:style/:filename"
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'``

And for now it seems to be working.
