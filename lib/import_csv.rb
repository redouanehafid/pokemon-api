require 'csv'

module ImportCSV

  def self.start
    csv_text = File.read('./pokemon.csv')
    csv = CSV.parse(csv_text, :headers => true)
    puts 'Start import pokemons from pokemon.csv'
    csv.each do |row|
      hash = row.to_hash  
      Pokemon.create!(
        'name' => hash['Name'], 
        'type_1' => hash['Type 1'],
        'type_2' => hash['Type 2'],
        'total' => hash['Total'],
        'hp' => hash['HP'],
        'attack' => hash['Attack'],
        'defense' => hash['Defense'],
        'sp_atk' => hash['Sp. Atk'],
        'dp_def' => hash['Sp. Def'],
        'speed' => hash['Speed'],
        'generation' => hash['Generation'],
        'legendary' => hash['Legendary']
      )
      print '.'
    end
    puts ''
    puts 'End import pokemons from pokemon.csv'
  end
end
