class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Using ActiveRecord query to avoid SQL injection
    @bookings = current_user.bookings
    Rails.logger.info "User #{current_user.email} accessed bookings index at #{Time.now}"
  end

  def new
    @booking = current_user.bookings.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      Rails.logger.info "User #{current_user.email} created a booking for room #{@booking.room_number} with subject '#{@booking.subject}' at #{Time.now}"
      redirect_to bookings_path, notice: "Booking created successfully!"
    else
      Rails.logger.error "Booking creation failed for user #{current_user.email} at #{Time.now}: #{@booking.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def search_xss
    # Assigning the search term from the params
    @search_term_xss = params[:username_xss]
    # Do not use .html_safe on user input!
    @results_xss = @search_term_xss
    Rails.logger.info "XSS search term received from user #{current_user.email} at #{Time.now}: #{@search_term_xss}"
  end

  def sensitive_data
    # Exposing sensitive data for demonstration purposes (insecure practice, avoid in production)
    @user_password = current_user.encrypted_password
    Rails.logger.warn "Sensitive data exposed for user #{current_user.email} at #{Time.now}. This is for demonstration purposes only!"
  end

  private

  def booking_params
    # Using strong parameters for security to whitelist allowed attributes
    params.require(:booking).permit(:room_number, :subject)
  end
end
