class CreateJournalArticles < ActiveRecord::Migration
  def change
    create_table :journal_articles do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :article_title
      t.string :abstract

      t.timestamps
    end
  end
end
