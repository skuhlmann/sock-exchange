require File.expand_path('../../../config/environment', __FILE__)

namespace "util" do
  task :check_pair do
    a = Group.last
    b = Swapper.where(email: "samkuhlmann@gmail.com").first
    c = a.swap_pairs.find { |s| s[0] === b.id.to_s  }
    giftee = Swapper.find(c[1])

    puts giftee.name
  end
end

