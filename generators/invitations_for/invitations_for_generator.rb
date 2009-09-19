class InvitationsForGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.class_collisions "Invitation", "#{class_name}InvitationMailer", "InvitationsController", "CreateInvitations"
      
      m.directory 'test/functional'
      m.directory 'test/unit'
      m.directory 'app/models'
      m.directory 'app/views/user_invitation_mailer'
      
      m.template 'invitation.rb', 'app/models/invitation.rb'
      m.template 'user_invitation_mailer.rb', "app/models/#{file_name}_invitation_mailer.rb"
      m.template 'invitation.erb', "app/views/#{file_name}_invitation_mailer/invitation.erb"
      
      m.template "mailer_test.rb", File.join('test/unit', "#{file_name}_invitation_mailer_test.rb")
      m.template 'invitation_test.rb',  File.join('test/unit', "invitation_test.rb")
      
      m.migration_template 'invitation_migration.rb', 'db/migrate', :migration_file_name => "create_invitations"
      
      unless options[:skip_controller]
        m.dependency 'controller', ['Invitations', 'new', 'create']
      end
      
      m.readme "README"
    end
  end
  
  protected
    def banner
      "Usage: #{$0} #{spec.name} UserModelName"
    end
    
    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--skip-controller",
             "Don't create a controller for creating/sending invitations") { |v| options[:skip_controller] = v }
    end
  
end
