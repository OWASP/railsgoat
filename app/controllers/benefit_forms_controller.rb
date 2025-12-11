# frozen_string_literal: true
class BenefitFormsController < ApplicationController

  def index
    @benefits = Benefits.new
    load_uploaded_files
  end

  def download
   begin
     path = params[:name]
     file = params[:type].constantize.new(path)
     send_file file, disposition: "attachment"
   rescue
     redirect_to user_benefit_forms_path(user_id: current_user.id)
   end
  end

  def upload
    file = params[:benefits][:upload]

    if file.nil?
      flash.now[:error] = "Please select a file to upload"
      @benefits = Benefits.new
      load_uploaded_files
      render :index
      return
    end

    # Validate file type
    allowed_extensions = %w[.pdf .doc .docx .jpg .jpeg .png]
    file_extension = File.extname(file.original_filename).downcase

    unless allowed_extensions.include?(file_extension)
      flash.now[:error] = "Invalid file type. Accepted formats: PDF, DOC, DOCX, JPG, PNG. You uploaded: #{file_extension}"
      @benefits = Benefits.new
      load_uploaded_files
      render :index
      return
    end

    # Validate file size (10MB max)
    max_size = 10.megabytes
    if file.size > max_size
      flash.now[:error] = "File too large. Maximum size: 10MB. Your file: #{(file.size / 1.megabyte.to_f).round(2)}MB"
      @benefits = Benefits.new
      load_uploaded_files
      render :index
      return
    end

    begin
      Benefits.save(file, params[:benefits][:backup])
      flash[:success] = "File '#{file.original_filename}' uploaded successfully!"
    rescue => e
      flash[:error] = "Failed to upload file: #{e.message}"
    end

    redirect_to user_benefit_forms_path(user_id: current_user.id)
  end

  private

  def load_uploaded_files
    data_path = Rails.root.join("public", "data")
    @uploaded_files = Dir.glob("#{data_path}/*").reject { |f| File.directory?(f) || File.basename(f) == '.gitkeep' }.map do |file|
      {
        name: File.basename(file),
        size: File.size(file),
        modified: File.mtime(file)
      }
    end.sort_by { |f| f[:modified] }.reverse
  end

end
