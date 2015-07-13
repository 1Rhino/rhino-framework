module Rhino
  class Cli
    def initialize(args)
      @args = args
      @template_path = File.join(File.dirname(__FILE__), 'generators', 'template_codes')
    end

    def run
      if @args[0] == 'new' && !@args[1].nil?
        new_app(@args[1])
      end
    end

    def new_app(app_name)
      structure_path = @template_path + '/structure'
      FileUtils.cp_r structure_path, app_name
      create_application_file(app_name)
      create_config_file(app_name)
      p "created app `#{app_name}`"
    end

    def create_application_file(app_name)
      template_file = File.read(@template_path + '/application.rb.tt')
      new_file_content = template_file.gsub('{{app_name}}', module_app_name(app_name))
      File.open("#{app_name}/config/application.rb", 'w') {|file| file.puts new_file_content }
    end

    def create_config_file(app_name)
      template_file = File.read(@template_path + '/config.ru.tt')
      new_file_content = template_file.gsub('{{app_name}}', module_app_name(app_name))
      File.open("#{app_name}/config.ru", 'w') {|file| file.puts new_file_content }
    end

    # convert from string to module_name: 'new_app' => 'NewApp'
    def module_app_name(name)
      name.split("_").map!{|x| x.capitalize}.join
    end

  end
end