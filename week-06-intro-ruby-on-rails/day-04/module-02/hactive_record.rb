## This simplifed ORM will give your models the ability to
## "save", "create", and get "all" instances of a model,
## by inheriting from HacktiveRecord::Base.

class HacktiveRecord
  class Base

    ####################
    # Instance Methods #
    ####################

    attr_reader :id

    def initialize(**kwargs)
      kwargs.each_pair do |name, arg|
        define_getter(name)
        define_setter(name, arg)
      end
    end

    def save
      assign_id
      self.class.all << self
      self
    end

    #################
    # Class Methods #
    #################

    def self.all
      @records ||= []
    end

    def self.create(**kwargs)
      self.new(kwargs).save
    end

    private

    def assign_id
      @id = self.id || last_id + 1
    end

    def last_id
      last = self.class.all.last
      last && last.id || 0
    end

    def define_getter(name)
      instance_variable_get("@#{name}")
    end

    def define_setter(name, arg)
      instance_variable_set("@#{name}", arg)
    end

  end
end
