class ShareController < ApplicationController
    def add
        email = params[:email]
        project = params[:project]
        access = params[:access]
        
        busca = User.where("email = '" + email.to_s + "'")
        if busca.size > 0 then
            user = busca[0]
            share = Share.where("project_id = " + project.to_s + "AND user_id = " + user.id.to_s)
            if share.size > 0 then
                share = share[0]
            else
                share = Share.new
            end
            share.project_id = project
            share.user_id = user.id
            share.accessa = access
            share.save
        end
        
        redirect_to project_path(project)
    end
    
    def remove
        project = params["project"]
        Share.delete(params[:id])
        redirect_to project_path(project)
    end
end
