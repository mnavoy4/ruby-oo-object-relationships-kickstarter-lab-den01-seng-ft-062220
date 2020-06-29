class Backer

    attr_reader :name

    @@all = []

    def initialize name
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def back_project project
        ProjectBacker.new(project, self)
    end

    def project_backers
        ProjectBacker.all.select do |project_backer|
            project_backer.backer == self
        end
    end

    def backed_projects
        project_backers.map do |project_backer|
            project_backer.project
        end
    end


end