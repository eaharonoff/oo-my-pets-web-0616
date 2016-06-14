require 'pry'
class Owner
  @@all = []
  attr_reader :species  
  attr_accessor :name, :pets
  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = { fishes: [],dogs: [],cats: [] }
  end

  def self.all 
    @@all 
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def say_species
   "I am a #{self.species}."
  end

  def buy_fish(fish)
    pet_fish = Fish.new(fish)
    self.pets[:fishes] << pet_fish
  end

  def buy_cat(cat)
    pet_cat = Cat.new(cat)
    self.pets[:cats] << pet_cat
  end

  def buy_dog(dog)
    pet_dog = Dog.new(dog)
    self.pets[:dogs] << pet_dog
  end

  def walk_dogs
    pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    pets[:cats][0].mood = "happy"
  end

  def feed_fish
    pets[:fishes][0].mood = "happy"
  end

  def sell_pets
    self.pets.each do |species, pet_array|
      pet_array.each do |each_pet|
        each_pet.mood == "happy" ? each_pet.mood = "nervous" : each_pet.mood = "nervous"
      end
      pet_array.clear
    end
  end

  def list_pets
    fish_count = self.pets[:fishes].count
    cat_count = self.pets[:cats].count
    dog_count = self.pets[:dogs].count
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end