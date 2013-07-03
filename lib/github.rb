module Github

  def self.all_repo
    @client.repos( 'bay6')
  end

  def self.all_commits repo
    @client.commits("#{repo.owner.login}/#{repo.name}")
  end

  class Repo

  end

end
