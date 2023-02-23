// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import './add_jquery'
import "jquery"
import "jquery_ujs"
//= require turbolinks

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import $ from "jquery";
window.jQuery = $;
window.$ = $;

Rails.start();
ActiveStorage.start();




