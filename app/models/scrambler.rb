class Scrambler
  attr_reader :swappers

  def initialize(swap_pool, *couples)
    @swap_pool = swap_pool
    @couples = set_couples(couples)
    @swappers = {}
    @giftee_pool = []
  end

  def scramble
    @giftee_pool = @swap_pool
    @swap_pool.each do |gifter|
      giftee = select_giftee(gifter, @giftee_pool)
      @swappers[gifter] = giftee
      @giftee_pool = @giftee_pool.reject { |g| g == giftee }
    end
  end

  def couple_rigged_scramble
    scramble

    if picked_couple?
      reset_scramble
      couple_rigged_scramble
    else
      puts "Success!"
    end
  end

  def couples_scramble
    @giftee_pool = @couples.flatten
    @couples.flatten.each_with_index do |gifter, index|
      unless need_to_rescramble?(gifter, index)
        giftee = select_couples_giftee(gifter, @giftee_pool)
        @swappers[gifter] = giftee
        @giftee_pool = @giftee_pool.reject { |g| g == giftee }
      end
    end

    if @swappers.keys.count != @couples.flatten.count
      reset_couples_scramble
    end
  end

  private

  def set_couples(couples)
    unless couples.empty?
      @couples = couples.first
    end
  end

  def select_giftee(gifter, swap_pool)
    giftee = swap_pool.sample

    unless unavailable_giftee?(giftee) || gifter == giftee
      giftee
    else
      swap_pool = swap_pool.reject { |s| s ==  giftee }
      select_couples_giftee(gifter, swap_pool)
    end
  end

  def select_couples_giftee(gifter, swap_pool)
    giftee = swap_pool.sample
    swap_couple = [gifter, giftee]

    unless invalid_combo?(swap_couple)
      giftee
    else
      swap_pool = swap_pool.reject { |s| s ==  giftee }
      select_couples_giftee(gifter, swap_pool)
    end
  end

  def invalid_combo?(swap_couple)
    swap_couple[0] == swap_couple[1] ||
    is_couple?(swap_couple) ||
    unavailable_giftee?(swap_couple[1])
  end

  def is_couple?(couple)
    @couples.any? { |c| c == couple || c == couple.reverse } 
  end

  def unavailable_giftee?(giftee)
    @swappers.values.any? { |s| s == giftee }
  end

  def need_to_rescramble?(gifter, index)
    couple_is_last_available_in_pool?(gifter) || 
    final_giftee_is_gifter_spouse?(index, gifter) || 
    final_giftee_is_gifter?(gifter)
  end

  def final_giftee_is_gifter_spouse?(gifter_index, gifter)
    (gifter_index + 1) == @couples.flatten.count &&
    @giftee_pool.count == 1 &&
    is_couple?([gifter, @giftee_pool[0]])
  end

  def couple_is_last_available_in_pool?(gifter)
    @giftee_pool == @couples.last
  end

  def final_giftee_is_gifter?(gifter)
    @giftee_pool.count == 1 &&
    gifter == @giftee_pool[0]
  end

  def picked_couple?
    @swappers.to_a.any? do |team|
       @couples.any? do |couple|
         couple == team || couple == team.reverse
       end
     end
  end

  def reset_scramble
    @swappers = {}
  end

  def reset_couples_scramble
    @swappers = {}

    couples_scramble
  end
end