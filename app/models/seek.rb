class Seek
  def self.create(uuid)
    if opponent = ReadCache.redis.spop("seeks")
      Game.start(uuid, opponent)
    else
      ReadCache.redis.sadd("seeks", uuid)
    end
  end

  def self.remove(uuid)
    ReadCache.redis.srem("seeks", uuid)
  end

  def self.clear_all
    ReadCache.redis.del("seeks")
  end
end
