class Post < ApplicationRecord
  validates :name, :body, presence: true

  after_commit :upload_sqlite3

  M = Mutex.new
  private_constant :M

  private def upload_sqlite3
    M.synchronize {
      bucket = TmpRailsSqlite3::Application.config.google_cloud_storage_bucket
      bucket.create_file("db/#{Rails.env}.sqlite3", 'production.sqlite3')
    }
  end
end
