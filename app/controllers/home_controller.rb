class HomeController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]

  def index
  end

  def search_xss
    @search_term_xss = params[:username_xss]

    # Directly reflecting user input (XSS vulnerability)
    # Use html_safe to prevent escaping the HTML
    @results_xss = @search_term_xss.html_safe

    render :index
  end

  def search_sql_injection
    @search_term_sql = params[:username_sql]

    # Vulnerable SQL query with raw user input
    sql = "SELECT * FROM users WHERE email LIKE '#{@search_term_sql}%'"
    @results_sql = ActiveRecord::Base.connection.execute(sql)

    render :index
  end
end
