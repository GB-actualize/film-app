
Movie.create(title: "Black Swan",
              cast: "Winona Ryder",
              poster: "http://tinyurl.com/hyhcykn")

Movie.create(title: "Beetlejuice",
              cast: "Michael Keaton",
              poster: "http://tinyurl.com/jxpbtng")

Movie.create(title: "Birdman or (The Unexpected Virtue of Ignorance)",
              cast: "Edward Norton",
              poster: "http://tinyurl.com/hn34fq3")

Movie.create(title: "Fight Club",
              cast: "Brad Pitt",
              poster: "http://tinyurl.com/j2cohzv")

Movie.create(title: "Mr. & Mrs. Smith",
              cast: "Angelina Jolie",
              poster: "http://tinyurl.com/jog6hav")

Movie.create(title: "Maleficent",
            cast: "Sharlto Copley",
            poster:"http://tinyurl.com/zdgqz9n")

#-----------------------game2

Movie.create(title: "Casino Royale",
              cast: "Mads Mikkelsen",
              poster: "http://tinyurl.com/z6g4sqp")

Movie.create(title: "Dr. Strange",
            cast: "Benedict Cumberbatch",
            poster: "http://tinyurl.com/j6h48pc")

Movie.create(title: "Star Trek: Into Darkness",
            cast: "Chris Pine",
            poster: "http://tinyurl.com/jgr39xh")

Movie.create(title: "Smokin' Aces",
            cast: "Ryan Reynolds",
            poster: "http://tinyurl.com/jcux8j3")

Movie.create(title: "Waiting",
              cast: "Anna Faris",
              poster: "http://tinyurl.com/gojejkb")

Movie.create(title: "Lost in Translation",
            cast: "Bill Murray",
            poster: "http://tinyurl.com/hanrhwt")

Game.create(status: "Activated",
            user_id: 1,
            search: "Black Swan")

MovieNode.create(title: "Black Swan",
                nodable_id: 1,
                nodable_type: "Game",
                poster_id: 44214,
                connection_name: "Winona Ryder",
                connection_category: "Actor",
                correct: true)

MovieNode.create(title: "Beetlejuice",
                nodable_id: 1,
                nodable_type: "MovieNode",
                poster_id: 4011,
                connection_name: "Michael Keaton",
                connection_category: "Actor",
                correct: false)

MovieNode.create(title: "Birdman or (The Unexpected Virtue of Ignorance)",
                nodable_id: 1,
                nodable_type: "MovieNode",
                poster_id: 194662,
                connection_name: "Edward Norton",
                connection_category: "Actor",
                correct: false)

MovieNode.create(title: "Fight Club",
                nodable_id: 1,
                nodable_type: "MovieNode",
                poster_id: 550,
                connection_name: "Brad Pitt",
                connection_category: "Actor",
                correct: false)

MovieNode.create(title: "Mr. & Mrs. Smith",
                nodable_id: 1,
                nodable_type: "MovieNode",
                poster_id: 787,
                connection_name: "Angelina Jolie",
                connection_category: "Actor",
                correct: false)

MovieNode.create(title: "Maleficent",
                nodable_id: 1,
                nodable_type: "MovieNode",
                poster_id: 102651,
                connection_name: "Sharlto Copley",
                connection_category: "Actor",
                correct: false)


#-------------------------game2

Game.create(status: "Activated",
            user_id: 1,
            search: "Casino Royale")

MovieNode.create(title: "Casino Royale",
                nodable_id: 2,
                nodable_type: "Game",
                poster_id: 36557,
                connection_name: "Mads Mikkelsen",
                connection_category: "Actor",
                correct: true)

MovieNode.create(title: "Dr. Strange",
                nodable_id: 2,
                nodable_type: "MovieNode",
                poster_id: 284052,
                connection_name: "Benedict Cumberbatch",
                connection_category: "Actor",
                correct: false)

MovieNode.create(title: "Star Trek: Into Darkness",
                nodable_id: 2,
                nodable_type: "MovieNode",
                poster_id: 54138,
                connection_name: "Chris Pine",
                connection_category: "Actor",
                correct: false)

MovieNode.create(title: "Smokin' Aces",
                nodable_id: 2,
                nodable_type: "MovieNode",
                poster_id: 7516,
                connection_name: "Ryan Reynolds",
                connection_category: "Actor",
                correct: false)

MovieNode.create(title: "Waiting...",
                nodable_id: 2,
                nodable_type: "MovieNode",
                poster_id: 7553,
                connection_name: "Anna Faris",
                connection_category: "Actor",
                correct: false)

MovieNode.create(title: "Lost in Translation",
                nodable_id: 2,
                nodable_type: "MovieNode",
                poster_id: 153,
                connection_name: "Bill Murray",
                connection_category: "Actor",
                correct: false)



#44214, 4011, 194662, 550, 787, 102651, 36557, 284052, 7516, 7553, 153] => movie ids
#call id to find movie poster
#attach movie poster to show page
#generate random movies per node(3)
#shuffle array of random movies with good movie bad movie generation
