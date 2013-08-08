namespace :server do
     
     desc "Start Rails"
     task :start do
       sh("rails s -d")
     end
     
     desc "Stop Rails"
     task :stop do
        pid_file = "tmp/pids/server.pid"
        if File.exists?(pid_file)
          Process.kill("INT", File.read(pid_file).to_i)
        else
          puts "[-] Server isn't running"
        end
     end
end

