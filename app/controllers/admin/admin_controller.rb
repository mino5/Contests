class Admin::AdminController < ApplicationController
layout 'admin'
protect_from_forgery

helper :all

def index
require_admin
end

def show
require_admin
end
end
