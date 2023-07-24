# pokemon_api_rest_n_list
Test technique pour entrevue @ PetalMD

Voir fichier calls_local.postman_collection.json pour les calls Postman
Aussi /pokemons and /pokemons_alternate dans le navigateur pour un format de liste visuelle.

Source of pokemons.csv : https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6

# May need to do : 
# rake db:drop RAILS_ENV=test/development
# rake db:create RAILS_ENV=test/development
# rake db:schema:load RAILS_ENV=test/development
# rake db:fixtures:load RAILS_ENV=test/development (notably for tests)
# rake pokemons:import[pokemons.csv]

Other notes : 

- J'ai pas vraiment gérer le mode "production" (e.g. CSRF pas géré, laisser / [root] et permet l'affichage des routes)
- Callable par Postman en local
- La raketask pokemons::import permet d'importer le CSV
- Ce n'était pas exactement très claire la pagination que vous vouliez (normalement quand on parle de pagination, on parle de page et on veut donc un affichage, je me suis donc permis de faire plus que juste un API: J'ai fait 2 versions (une avec call au serveur pour chaque page [/index, pagy & dataTable], une sans [/index_alternate, tout loadé naïvement (y'a pas tant de pokémons), je laisse dataTable paginé le tout]; un lien est présent et permet facilement la navigation entre les 2 versions).
- J'ai mis un boute "delete" dans le tableau (pour le fun).
- Vous disiez vouloir pouvoir obtenir "une liste", ce qui était ambigu : voulait-on un visuel ou un juste le data? J'ai donc fait les 2.
- Vous m'encouragiez à écrire des tests unitaires. N'ayant pas vraiment de logique "unitaire" (hormis la lecture du CSV) à tester j'ai plus fait une sorte d'hybride avec des tests d'intégrations pour le Controller & FactoryBot.
