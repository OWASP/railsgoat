class Benefits < ActiveRecord::Base
 attr_accessor :backup
 
 def self.save(file, backup=false)
   data_path = Rails.root.join("public", "data")
   full_file_name = "#{data_path}/#{file.original_filename}"
   f = File.open(full_file_name, "w+")
   f.write file.read
   f.close
   make_backup(file, data_path, full_file_name) if backup == "true"
 end
 
 def self.make_backup(file, data_path, full_file_name)
    if File.exists?(full_file_name)
    system("cp #{full_file_name} #{data_path}/bak#{Time.now.to_i}_#{file.original_filename}")
    end
  rescue
 end

=begin 
  def self.make_backup(file, data_path, full_file_name)
    FileUtils.cp "#{full_file_name}", "#{data_path}/bak#{Time.now.to_i}_#{file.original_filename}"
  end
=end 
 
end
