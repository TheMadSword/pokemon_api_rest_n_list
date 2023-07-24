FactoryBot.define do
  factory :pokemon do
    pokedex_id { rand(20) }
    name { Faker::Alphanumeric.alphanumeric(number: 20) }
    type1 { rand(2) == 1 ? "Fire" : "Water" }
    type2 { rand(2) == 1 ? "Grass" :  "" }
    total { rand(100) }
    hp { rand(20) }
    attack { rand(20) }
    defense { rand(20) }
    sp_atk { rand(20) }
    sp_def { rand(20) }
    speed { rand(20) }
    generation { rand(10) }
    legendary { rand(2) }
  end
end