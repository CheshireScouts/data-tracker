class CreateCompositeView < ActiveRecord::Migration
  def up
    sql = 
      'CREATE VIEW composites AS
      SELECT c.organisation, c.year, c.scout_type, a.award_count, m.head_count
      FROM
        (SELECT 
          o.id as organisation_id, o.name as organisation,
          y.id as year_id, y.name as year,
          t.id as scout_type_id, t.name as scout_type
        FROM organisations o
        CROSS JOIN years y
        CROSS JOIN scout_types t) c
      LEFT JOIN
        (SELECT a.organisation_id, a.year_id, t.scout_type_id, SUM(a.award_count) as award_count
        FROM awards a
        JOIN award_types t
        ON a.award_type_id = t.id
        GROUP BY a.organisation_id, a.year_id, t.scout_type_id) a
      ON c.organisation_id = a.organisation_id AND c.year_id = a.year_id AND c.scout_type_id = a.scout_type_id
      LEFT JOIN
        (SELECT m.organisation_id, m.year_id, m.scout_type_id, SUM(m.head_count) as head_count
        FROM memberships m
        GROUP BY m.organisation_id, m.year_id, m.scout_type_id
        ) m
      ON c.organisation_id = m.organisation_id AND c.year_id = m.year_id AND c.scout_type_id = m.scout_type_id'
    execute(sql)
    end

  def down
    sql = 'DROP VIEW composites'
    execute(sql)
  end
end
