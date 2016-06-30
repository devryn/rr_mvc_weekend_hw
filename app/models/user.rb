require 'faker'
class User
  @@all = []
  @@each = []
  attr_accessor :first_name, :last_name, :id, :age

  def initialize(first_name, last_name, id, age)
    @@all << self
    @first_name = first_name
    @last_name = last_name
    @id = id
    @age = age
  end

  def to_json(json_arg = nil)
    {
      first_name: @first_name,
      last_name: @last_name,
      id: @id,
      age: @age,
    }.to_json
  end

  def User.all
    @@all
  end
end

100.times do |n|
  User.new(Faker::Name.first_name, Faker::Name.last_name, n, rand(1..150))
end
