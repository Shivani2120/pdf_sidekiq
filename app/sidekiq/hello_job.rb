class HelloJob
  include Sidekiq::Job

  def perform(*args)
    puts "hello world"
  end
end
