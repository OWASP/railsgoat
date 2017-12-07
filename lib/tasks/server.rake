# frozen_string_literal: true
namespace :server do

     desc "Start Rails"
     task :start do
      pid_file = "tmp/pids/server.pid"
       if !(File.exist?(pid_file))
         sh("rails s -d")
       else
         puts "[+] Server is already running"
       end
     end

     desc "Stop Rails"
     task :stop do
        pid_file = "tmp/pids/server.pid"
        if File.exist?(pid_file)
          Process.kill("INT", File.read(pid_file).to_i)
        else
          puts "[-] Server isn't running"
        end
     end
end
