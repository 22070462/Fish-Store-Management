RailsAdmin.config do |config|
  config.asset_source = :sprockets

  # Ensure the user is redirected if they are not an admin
  config.authenticate_with do
    if current_user && !current_user.admin?
      redirect_to '/', alert: "You are not authorized to view this page." # Use '/' instead of root_path
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
