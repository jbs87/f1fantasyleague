class UpdateRaceResults < ActiveRecord::Migration
		def up
			remove_column :race_results, :team_member_id
		end

		def down
			add_column :race_results, :team_member_id, :integer
		end
end
