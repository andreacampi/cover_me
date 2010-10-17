def run_cover_me_at_end
  last_task = Rake.application.top_level_tasks.last
  Rake::Task[last_task].enhance do
    Rake::Task['cover_me:report'].invoke
  end
end

namespace :cover_me do
  
  task :report do
    require 'cover_me'
    CoverMe.complete!
  end
  
end

task :test do
  run_cover_me_at_end
end

task :spec do
  run_cover_me_at_end
end
