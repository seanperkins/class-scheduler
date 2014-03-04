class individual


  def initialize(initial_block_genotype)
    # sort the initial_block_genotype by key
    @block_genotype     = BlockGenotype.new(initial_block_genotype)
    @schedule_phenotype = SchedulePhenotype.new(@block_genotype)
  end

  def get_block_genotype
    @block_genotype
  end

  def get_fitness
    fitness_eval = FitnessEvaluator.initialize
    return fitness_eval.get_fitness(self)
  end

end

# --------------------------------------------------------------------------------------------------------
class BlockGenotype
  

  def initialize()
    @genotype_hash = Hash.new
  end

  def get_genotype_hash
    @genotype_hash
  end

  def generate_new(block_array)
    @genotype_hash = Hash.new
    # pick blocks at random
    hash_index = 0
    while !block_array.empty? do
      index = Random.new.rand(block_array.size)
      block =  block_array[index]

      # do stuff
      @genotype_hash[block] = hash_index
      hash_index += block.get_duration_in_minutes / period_size_minutes

      block_array.delete_at(index)
    end
  end

end

# --------------------------------------------------------------------------------------------------------
class SchedulePhenotype

  def initialize(block_genotype)
    @schedule_phenotype_array = Array.new(num_time_slots)
     # walk through block_genotype and assign appropriate values to the schedule
    block_genotype.each do |block, index|

      num_time_slots.times do |i|
        schedule_phenotype_array[index + i] = block
      end

    end
  end

  # returns block object at index
  def get_index (index)
    return @schedule_phenotype_array[index]
  end

  def set_index(block, index)
    @schedule_phenotype_array[index] = block
  end

  # returns first index for that day
  def get_day (day)

  end
  
  # returns first index for that hour
  # optionally pass in an index to start searching from, ignoring previous indicies, pass '0' to start from begining
  def get_hour (hour, index)

  end

  # returns first index for that classroom
  # optionally pass in an index to start searching from, ignoring previous, pass '0' to start from begining
  def get_classroom (classroom, index)
  
  end

  # returns first index for that class
  # optionally pass in an index to start searching from, ignoring previous indicies, pass '0' to start from begining
  def get_subject (subject, index)

  end

  def get_schedule_phenotype
    @schedule_phenotype_array
  end

end

# --------------------------------------------------------------------------------------------------------
class FitnessEvaluator
  # possibly make this a singleton for more logical access from the Individual class

  def initialize(fitness_comparator_array)
    @comparators = load_fitness_comparators_from_config
  end

  def get_fitness(individual)
    fitness = 0
    
    @comparator_array.each do |comparator| 
      fitness += comparator.assess_fitness(individual)
    end

    fitness

  end

end

# --------------------------------------------------------------------------------------------------------
class LunchStartsAtNoonFitnessComparator

  # This comparator has a max fitness score of 5

  def assess_fitness(individual)
    fitness = 0
    
    days_per_week.times do |day|
      day_index   = individual.schedule_phenotype.get_day(day,0)
      hour_day_index  = individual.schedule_phenotype.get_hour(12,day_index)

      if :lunch == individual.schedule_phenotype[hour_day_index]
        fitness++
      end
    end

    fitness
  end
end

# --------------------------------------------------------------------------------------------------------
class Population

  individuals
  fittest_individuals = Array.new(fit_individuals_to_track) {Indivudial.new}

  def initialize(population_size)
    individuals = Array.new(population_size)
  end

  def get_individual(index)
    return individuals[index]
  end

  def get_fittest
    fittest_individuals = individuals.sort_by{|individual| individual.fitness}[0,fit_individuals_to_track]

  end

  def size
    individuals.count
  end


end

# --------------------------------------------------------------------------------------------------------
class Algorithm


  def evolve_population
    # mutate the population
    # crossover the population
  end

  def mutate(individual)
    # calculate probability of mutating via mutation_rate
    # if mutation will occur randomly select two indicies in the individual's BlockGenotype
    # choose one and insert it before the other, move other indicies accordingly
    # refresh SchedulePhenotype for individual by passing in the new genotype
  end

  def crossover(individual_a, individual_b)
    individual_c = Individual.new

    # randomly pick a number of cross over sites = cross_over_sites
    # create new genotype hash by cross merging subsets
    # individual_a[0..point_1].merge(individual_b[point_1+1..point_2]).merge...etc
  end

  def tournament_selection(population)
    # select a random sub_population of size tournament_size

    # return the fittest individual from that population

  end


end

# --------------------------------------------------------------------------------------------------------
## Config Params ##

#SchedulePhenotype
days_per_week       = 5
class_rooms         = 5
hours_per_day       = 8
period_size_minutes = 10
num_time_slots      = days_per_week * class_rooms * hours_per_day * (60/period_size_minutes)

#BlockGenotype

#Individual

#Population
fit_individuals_to_track  = 100
population_max            = 10000
birth_rate                = 10
death_rate                = 5

#Algorithm
mutation_rate         = .01
mutation_events       = 1
cross_over_sites      = 2
tournament_size       = 10



