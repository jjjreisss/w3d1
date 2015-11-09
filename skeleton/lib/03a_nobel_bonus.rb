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
  SELECT
    no_chem.yr
  FROM
    (
      SELECT
        *
      FROM
        nobels
      WHERE
        subject != 'Chemistry'
    ) as no_chem
  WHERE
    no_chem.subject = 'Physics'
  SQL
end
