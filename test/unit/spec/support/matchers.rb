#
# Custom Matchers for non-existent LWRP matchers
#

def create_mysql_database(database)
    ChefSpec::Matchers::ResourceMatcher.new(:mysql_database, :create, database)
end

def create_mysql_database_user(user)
    ChefSpec::Matchers::ResourceMatcher.new(:mysql_database_user, :create, user)
end

def grant_mysql_database_user(user)
    ChefSpec::Matchers::ResourceMatcher.new(:mysql_database_user, :grant, user)
end
