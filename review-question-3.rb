# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'
require_relative "./user.rb"
require_relative "./photo.rb"
require_relative "./comment.rb"


class User
    attr_accessor :name


    def initialize(name)
        self.name = name
    end

    def photos
        Photo.all.select {|photo| photo.user == self}
    end



end

class Comment

    attr_reader :photo, :text

    @@all = []

    def initialize(photo, text)
        @photo = photo
        @text = text
        @@all << self
    end

    def self.all
        @@all
    end


end

class Photo

    attr_accessor :user
    @@all = []

    def initialize(user=nil)
        @user = user
        @@all << self
    end

    def self.all
        @@all
    end

    def comments
        Comment.all.select {|comment| comment.photo == self}
    end

    def make_comment(text)
        Comment.new(self, text)
    end


end

photo = Photo.new
user = User.new("Sophie")
photo.user = user
photo.user.name
# => "Sophie"
user.photos
# => [<photo 1>]


photo.comments
# => []

photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
photo.comments
# => [<comment1>]
binding.pry
Comment.all
#=> [<comment1>]
