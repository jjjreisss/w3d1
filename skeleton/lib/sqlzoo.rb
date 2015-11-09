require 'pg'

def execute(sql)
  conn = PG::Connection.open(:dbname => 'sqlzoo')
  query_result = conn.exec(sql).values
  conn.close

  query_result
end

# SELECT
#   a.name
# FROM
#   actors a
# JOIN (
#   SELECT
#     c.actor_id
#   FROM
#     (
#       SELECT c.movie_id, c.actor_id
#       FROM castings c
#       JOIN actors a
#       ON a.id = c.actor_id
#       WHERE a.name = 'Art Garfunkel'
#     ) as art_movies
#   JOIN castings c
#     ON c.movie_id = art_movies.movie_id
#   WHERE c.actor_id != art_movies.actor_id
# ) as art_cocastings
# ON a.id = art_cocastings.actor_id
