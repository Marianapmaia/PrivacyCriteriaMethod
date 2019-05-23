module ProjectsHelper
    def accessType(string)
        if string == "0" then
            return "Just View"
        else
            return "View and Edit"
        end
    end
end
