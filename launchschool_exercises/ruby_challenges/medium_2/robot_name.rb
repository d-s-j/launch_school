class Robot
  attr_reader :name
  @@existing_names = []

  def initialize
    @name = generate_name
  end

  def reset
    self.name = generate_name
  end

  private
  attr_writer :name

  def generate_name
    name = ""
    loop do
      name << [*('AA'..'ZZ')].sample
      name << [*('000'..'999')].sample
      break if !@@existing_names.include?(name)
      name = ""
    end

    @@existing_names << name
    name
  end
end
