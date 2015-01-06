class AddScoreAndBudgetToPlayerTeam < ActiveRecord::Migration
  def change
    add_column :player_teams, :score,  :integer
    add_column :player_teams, :budget, :integer
  end
end
