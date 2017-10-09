begin
  require 'awesome_print'
rescue LoadError => err
  puts "no awesome_print :("
end

begin
  if defined?(PryDebugger) || defined?( PryByebug )
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
  end
rescue LoadError => err
  puts err
end

Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

# Crude way of measuring performance between code blocks
# measure(10, [ ->(){ puts 1 + 2 + 3 + 4 }, ->(){[0..4].reduce(&:+)} ])
#

def measure(run_count, procs)
  Benchmark.bm(run_count) do |x|
    procs.each do |pr|
      x.report{ pr.call }
    end
    nil
  end
end
