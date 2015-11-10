# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which yrs was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT DISTINCT
      p.yr
    FROM
      nobels p

    WHERE
      p.subject = 'Physics' AND p.yr NOT IN (
        SELECT
          yr
        FROM
          nobels
        WHERE
          subject = 'Chemistry')
      
  SQL
end
