class CreateCompositeView < ActiveRecord::Migration
  def up
    sql = 
      'CREATE VIEW composites AS
      SELECT c.organisation_id, c.organisation, c.year_id, c.year, c.scout_type_id, c.scout_type, a.award_count, m.head_count
      FROM
        (SELECT 
          o.id as organisation_id, o.name as organisation,
          y.id as year_id, y.name as year,
          t.id as scout_type_id, t.name as scout_type
        FROM organisations o
        CROSS JOIN years y
        CROSS JOIN scout_types t) c
      LEFT JOIN
        (SELECT organisation_id, year_id, scout_type_id, SUM(award_count) as award_count
        FROM awards
        GROUP BY organisation_id, year_id, scout_type_id) a
      ON c.organisation_id = a.organisation_id AND c.year_id = a.year_id AND c.scout_type_id = a.scout_type_id
      LEFT JOIN
        (SELECT m.organisation_id, m.year_id, m.scout_type_id, SUM(m.head_count) as head_count
        FROM memberships m
        GROUP BY m.organisation_id, m.year_id, m.scout_type_id
        ) m
      ON c.organisation_id = m.organisation_id AND c.year_id = m.year_id AND c.scout_type_id = m.scout_type_id
      WHERE a.award_count IS NOT NULL OR m.head_count IS NOT NULL'
    execute(sql)
    end

  def down
    sql = 'DROP VIEW composites'
    execute(sql)
  end
end
