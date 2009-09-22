acts\_as\_inviteable
================

A simple to use plugin for creating an invite system for an app.


### Generator

Use the generator to get started:

    script/generate invitations_for User
    
When it's finished be sure to add this to your routes file (`config/routes.rb`):

    map.resource :invitation, :only => [:new, :create]
    map.signup   '/signup/:invite_code', :controller => 'users', :action => 'new'
    
You also need to add `acts_as_inviteable` to your `User` model.

Finally you need to run `rake db:migrate` to add the invitations table and invitation_limit column.


### Options

By default users are allowed to invite 5 others. If you wish to change this you must do so in 2 places.  
First modify the migration file before running `rake db:migrate`.
Change the default value for the `invitation_limit` column that is being added to the users table.  
Then you change how you call `acts_as_inviteable` in your users model by adding the `default_invitation_limit` option:

    acts_as_inviteable :default_invitation_limit => 20


Copyright (c) 2009 Brian Landau (Viget Labs), released under the MIT license
