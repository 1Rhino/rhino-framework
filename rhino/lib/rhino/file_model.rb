require 'multi_json'
module Rhino
  module Model
    class FileModel

      def initialize(file_name)
        @file_name = file_name

        base_name = File.split(file_name)[-1]
        @id = File.basename(base_name, ".json").to_i

        obj = File.read(file_name)
        @hash = MultiJson.load(obj)
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        FileModel.new("db/quotes/#{id}.json")
      rescue
        nil
      end

      def self.all
        files = Dir['db/quotes/*.json']
        files.map{|f| FileModel.new f}.select{|x| !x.nil? }
      end

      # TODO
      def self.find_by_committer(committer)
      end

      # TODO
      def self.where(options={})
      end

      # TODO
      def update_attribute(options={})
      end

    end
  end
end

